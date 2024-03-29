package org.zhongweixian.cc.util;


import com.fasterxml.jackson.core.JsonGenerator.Feature;
import com.fasterxml.jackson.core.json.JsonWriteFeature;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import java.io.IOException;


/**
 * Created by caoliang on 2020/8/31
 */
public class Json {
    private static final ObjectMapper defaultObjectMapper = newDefaultMapper();
    private static volatile ObjectMapper objectMapper = null;

    public static ObjectMapper newDefaultMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new Jdk8Module());
        mapper.registerModule(new JavaTimeModule());
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return mapper;
    }

    /**
     * Get the ObjectMapper used to serialize and deserialize objects to and from JSON values.
     * <p>
     * This can be set to a custom implementation using Json.setObjectMapper.
     *
     * @return the ObjectMapper currently being used
     */
    public static ObjectMapper mapper() {
        if (objectMapper == null) {
            return defaultObjectMapper;
        } else {
            return objectMapper;
        }
    }

    private static String generateJson(Object o, boolean prettyPrint, boolean escapeNonASCII) {
        try {
            ObjectWriter writer = mapper().writer();
            if (prettyPrint) {
                writer = writer.with(JsonWriteFeature.WRITE_NAN_AS_STRINGS);
            }
            if (escapeNonASCII) {
                writer = writer.with(JsonWriteFeature.ESCAPE_NON_ASCII);
            }
            return writer.writeValueAsString(o);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Convert an object to JsonNode.
     *
     * @param data Value to convert in Json.
     */
    public static JsonNode toJson(final Object data) {
        try {
            return mapper().valueToTree(data);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Convert a JsonNode to a Java value
     *
     * @param json  Json value to convert.
     * @param clazz Expected Java value type.
     */
    public static <A> A fromJson(JsonNode json, Class<A> clazz) {
        try {
            return mapper().treeToValue(json, clazz);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Creates a new empty ObjectNode.
     */
    public static ObjectNode newObject() {
        return mapper().createObjectNode();
    }

    /**
     * Creates a new empty ArrayNode.
     */
    public static ArrayNode newArray() {
        return mapper().createArrayNode();
    }

    /**
     * Convert a JsonNode to its string representation.
     */
    public static String stringify(JsonNode json) {
        return generateJson(json, false, false);
    }

    /**
     * Convert a JsonNode to its string representation, escaping non-ascii characters.
     */
    public static String asciiStringify(JsonNode json) {
        return generateJson(json, false, true);
    }

    /**
     * Convert a JsonNode to its string representation.
     */
    public static String prettyPrint(JsonNode json) {
        return generateJson(json, true, false);
    }

    /**
     * Parse a String representing a json, and return it as a JsonNode.
     */
    public static JsonNode parse(String src) {
        try {
            return mapper().readTree(src);
        } catch (Throwable t) {
            throw new RuntimeException(t);
        }
    }

    /**
     * Parse a InputStream representing a json, and return it as a JsonNode.
     */
    public static JsonNode parse(java.io.InputStream src) {
        try {
            return mapper().readTree(src);
        } catch (Throwable t) {
            throw new RuntimeException(t);
        }
    }

    /**
     * Parse a byte array representing a json, and return it as a JsonNode.
     */
    public static JsonNode parse(byte[] src) {
        try {
            return mapper().readTree(src);
        } catch (Throwable t) {
            throw new RuntimeException(t);
        }
    }

    /**
     * Inject the object mapper to use.
     * <p>
     * This is intended to be used when Play starts up.  By default, Play will inject its own object mapper here,
     * but this mapper can be overridden either by a custom plugin or from Global.onStart.
     */
    public static void setObjectMapper(ObjectMapper mapper) {
        objectMapper = mapper;
    }

    /**
     * Parse a byte array representing a a Java value
     *
     * @param src   byte value to convert.
     * @param clazz Expected Java value type.
     */
    public static <A> A fromJson(byte[] src, Class<A> clazz) {
        try {

            return mapper().treeToValue(Json.parse(src), clazz);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
