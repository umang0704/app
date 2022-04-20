package com.eea.resources;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class ApplicationResource {
  public final static String SAMPLE_FILE_FOR_ALL_PE_MEMBER="sample file format for all members of PE";
  public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
          Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
  public static List<String> PE_FILE_HEADERS = new ArrayList<>();
  static {
    PE_FILE_HEADERS.add("Name");
    PE_FILE_HEADERS.add("Email");
    PE_FILE_HEADERS.add("Contact");
    PE_FILE_HEADERS.add("Address");
    PE_FILE_HEADERS.add("City");
    PE_FILE_HEADERS.add("State");
  }
}