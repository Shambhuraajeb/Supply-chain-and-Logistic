package com.scm.Manufacturer;

public class JsonHelper {
    public static String extractJsonValue(String json, String key) {
        if (json != null && json.contains(key)) {
            // Split the string at the key and extract the value after the key
            String[] parts = json.split(key);
            if (parts.length > 1) {
                String value = parts[1].split("\"")[0];
                
                // Check if the value is numeric
                if (value.matches("[0-9]+") || value.matches("[0-9]*\\.?[0-9]+")) {
                    // It's a numeric value, return it as is
                    return value;
                } else {
                    // It's a string, return it without modification
                    return value;
                }
            }
        }
        return ""; // Return empty string if key is not found
    }

    // Method to handle complex JSON data with objects
    public static String extractJsonValueFromObject(String json, String key) {
        // If the key exists, extract its value
        String keyPattern = "\"" + key + "\":\"";
        if (json != null && json.contains(keyPattern)) {
            String[] parts = json.split(keyPattern);
            if (parts.length > 1) {
                String value = parts[1].split("\"")[0];  // Extract the value after the key
                return value;  // Return the extracted value
            }
        }
        return ""; // Return empty if the key does not exist
    }
}
