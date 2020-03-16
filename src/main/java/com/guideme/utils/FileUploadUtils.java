package com.guideme.utils;

import com.guideme.dto.ExcursionDto;
import com.guideme.dto.FileConsistingDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

import static java.util.Objects.nonNull;
import static java.util.UUID.randomUUID;

public class FileUploadUtils {
	public static void setUploadedFile(@RequestParam("file") MultipartFile file, FileConsistingDto dto, String uploadPath) throws IOException {
		if (nonNull(file) && !file.getOriginalFilename().isEmpty()) {
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			String uuidFile = randomUUID().toString();
			String resultFilename = uuidFile + "." + file.getOriginalFilename();
			file.transferTo(new File(uploadPath + "/" + resultFilename));
			dto.setFilename(resultFilename);
		}
	}
}
