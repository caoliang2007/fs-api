package org.zhongweixian.cc.command;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.zhongweixian.cc.cache.CacheService;
import org.zhongweixian.cc.fs.FsListen;
import org.zhongweixian.esl.transport.SendMsg;

/**
 * Created by caoliang on 2020/11/6
 */
public class BaseHandler {
    protected Logger logger = LoggerFactory.getLogger(BaseHandler.class);

    @Autowired
    protected FsListen fsListen;

    @Autowired
    protected CacheService cacheService;

    @Autowired
    protected GroupHandler groupHandler;

    @Autowired
    protected TransferIvrHandler transferIvrHandler;

    @Autowired
    protected TransferCallHandler transferCallHandler;

    @Autowired
    protected TransferAgentHandler transferAgentHandler;


    /**
     * 被叫挂机时，需要把主叫挂机，主叫挂机时不需要单独挂被叫
     *
     * @param callId
     * @param deviceId
     */
    protected void hangupCall(String media, Long callId, String deviceId) {
        SendMsg hangupMsg = new SendMsg(deviceId);
        hangupMsg.addCallCommand("execute");
        hangupMsg.addExecuteAppName("hangup");
        hangupMsg.addExecuteAppArg("NORMAL_CLEARING");
        logger.info("hangup callId:{}, device:{}", callId, deviceId);
        fsListen.sendMessage(media, hangupMsg);
    }

    /**
     * 放音
     *
     * @param media
     * @param deviceId
     * @param file
     */
    protected void playback(String media, String deviceId, String file) {
        SendMsg playback = new SendMsg(deviceId);
        playback.addCallCommand("execute");
        playback.addExecuteAppName("playback");
        playback.addExecuteAppArg(file);
        fsListen.sendMessage(media, playback);
    }

    /**
     * @param media
     * @param callId
     * @param deviceId
     */
    protected void receiveDtmf(String media, Long callId, String deviceId) {
        SendMsg play = new SendMsg(deviceId);
        play.addCallCommand("execute");
        play.addExecuteAppName("set");
        play.addExecuteAppArg("playback_delimiter=!");
        fsListen.sendMessage(media, play);

        SendMsg digits = new SendMsg(deviceId);
        digits.addCallCommand("execute");
        digits.addExecuteAppName("play_and_get_digits");
        digits.addExecuteAppArg("1 1 1 5000 # /app/clpms/sounds/1295e6a58f9e2115332666.wav silence_stream://250 SYMWRD_DTMF_RETURN [\\*0-9#]+ 3000");
        fsListen.sendMessage(media, digits);
    }

}
