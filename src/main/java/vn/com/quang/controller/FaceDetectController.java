package vn.com.quang.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.quang.service.FaceDetectService;

@Controller
@Transactional
public class FaceDetectController {

	@Autowired
	FaceDetectService faceDetectService;

	@RequestMapping(value = "/faceDetect", method = RequestMethod.GET)
	public String faceDetectScreen(Model model) {
		try {
			BufferedImage img = this.faceDetectService.faceDetect("D:\\tayduky.jpg");
			File outputFile = new File("D:\\output.jpg");

			ImageIO.write(img, "jpg", outputFile);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "faceDetect";
	}

}
