package org.zhongweixian.cc.fs.handler;

import org.cti.cc.po.CallInfo;
import org.cti.cc.po.DeviceInfo;
import org.cti.cc.po.GroupInfo;
import org.cti.cc.po.NextCommand;
import org.springframework.stereotype.Component;
import org.zhongweixian.cc.configration.HandlerType;
import org.zhongweixian.cc.fs.event.FsPlaybackStop;
import org.zhongweixian.cc.fs.handler.base.BaseEventHandler;

/**
 * Created by caoliang on 2020/11/6
 */
@Component
@HandlerType("PLAYBACK_STOP")
public class FsPlaybackStopHandler extends BaseEventHandler<FsPlaybackStop> {

    @Override
    public void handleEvent(FsPlaybackStop event) {
        CallInfo callInfo = cacheService.getCallInfo(event.getDeviceId());
        if (callInfo == null) {
            return;
        }
        DeviceInfo deviceInfo = callInfo.getDeviceInfoMap().get(event.getDeviceId());
        NextCommand nextCommand = deviceInfo.getNextCommand();
        if (deviceInfo == null || nextCommand == null) {
            return;
        }
        deviceInfo.setNextCommand(null);
        logger.info("callId:{} playstop, nextType:{}", callInfo.getCallId(), nextCommand.getNextType());
        switch (nextCommand.getNextType()) {
            case NEXT_QUEUE_PLAY:
                super.playback(callInfo.getMedia(), event.getDeviceId(), "/app/clpms/sounds/queue.wav");
                break;

            case NEXT_QUEUE_OVERFLOW_GROUP:
                GroupInfo groupInfo = cacheService.getGroupInfo(Long.parseLong(nextCommand.getNextValue()));
                groupHandler.hander(event.getDeviceId(), callInfo, groupInfo);
                break;

            case NEXT_QUEUE_OVERFLOW_IVR:
                break;

            case NEXT_QUEUE_OVERFLOW_VDN:
                break;

            case NEXT_QUEUE_OVERFLOW_HANGUP:
                super.hangupCall(event.getHostname(), callInfo.getCallId(), event.getDeviceId());
                break;

            case NEXT_HANGUP:
                super.hangupCall(event.getHostname(), callInfo.getCallId(), event.getDeviceId());
                break;

            case NEXT_VDN:
                break;

            case NEXT_GROUP:
                break;

            case NEXT_IVR:
                break;


        }
    }

}
