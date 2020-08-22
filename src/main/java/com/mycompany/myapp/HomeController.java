package com.mycompany.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.bean.Music;
import com.mycompany.myapp.service.MusicService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MusicService musicService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String myId, String myPwd,HttpSession session) {
		
		System.out.println("id="+myId);
		System.out.println("pwd="+myPwd);

		if(myId.equals("abcde") && myPwd.equals("1234")) {
			session.setAttribute("isLogined", "true");
			System.out.println("사용자 일치");
			return "redirect:/successed";}
		if(myId.equals("Master")&&myPwd.equals("Master")) {
			session.setAttribute("Master", "true");
			return "redirect:/successed";
		}
		else return "redirect:/failed";
	}
	
	@RequestMapping(value = "/successed", method = RequestMethod.GET)
	public String success(Model model,HttpSession session) {
		try {
		String result = (String)session.getAttribute("isLogined");
		String result2 = (String)session.getAttribute("Master");
		if(result == null && result2 == null)throw new Exception();
		System.out.println("success메소드 실행 성공");
		model.addAttribute("list",musicService.selectMusic());
		return "view";}
		catch(Exception e) {
			return "failed";
		}
		}
	
	@RequestMapping(value = "/failed", method = RequestMethod.GET)
	public String failed(Model model) {
		
		
		return "failed";
		}
	@RequestMapping(value = "/add")
	public String add(Model model, HttpSession session) {
		String result2 = (String)session.getAttribute("Master");
		if(result2 == null) return "notmaster";
		
		
		return "musicform";

	}
	
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("music") Music music, Model model, String url) {
    	String embed = "https://www.youtube.com/embed/";
    	String Id = url.substring(url.length()-11);
    	url = embed.concat(Id);
		music.setUrl(url);
		musicService.insertMusic(music);
		
		model.addAttribute("list",musicService.selectMusic());
    	return "redirect:/successed";    

	}
	
	@RequestMapping(value = "/editmusic/{id}")
	public String editmusic(Model model,@PathVariable int id,HttpSession session) {
		String result2 = (String)session.getAttribute("Master");
		if(result2 == null) return "notmaster";
		System.out.println("Control : " + id);
		model.addAttribute("music",musicService.selectMusicById(id));
		return "editform";
	}
	
    @RequestMapping(value="/editsave",method = RequestMethod.POST)    
    public String editsave(@ModelAttribute("music") Music music, String url){   
    	String embed = "https://www.youtube.com/embed/";
    	String Id = url.substring(url.length()-11);
    	url = embed.concat(Id);
		music.setUrl(url);
    	musicService.updateMusic(music);
    	return "redirect:/successed";    
    }    
    
    @RequestMapping(value="/deletemusic/{id}")    
    public String delete(@PathVariable int id, HttpSession session){    
		String result2 = (String)session.getAttribute("Master");
		if(result2 == null) return "notmaster";
    	musicService.deleteMusic(id);
    	return "redirect:/successed";    
    }    
	
    @RequestMapping(value="/artistOrder")    
    public String artistOrder(Model model,HttpSession session){   
		try {
		String result = (String)session.getAttribute("isLogined");
		String result2 = (String)session.getAttribute("Master");
		if(result == null && result2 == null)throw new Exception();
		System.out.println("success메소드 실행 성공");
		model.addAttribute("list",musicService.selectMusicByArtist());
		return "view";}
		catch(Exception e) {
			return "failed";
		}
    }    
    
    @RequestMapping(value="/titleOrder")    
    public String titleOrder(Model model,HttpSession session){   
		try {
		String result = (String)session.getAttribute("isLogined");
		String result2 = (String)session.getAttribute("Master");
		if(result == null && result2 == null)throw new Exception();
		System.out.println("success메소드 실행 성공");
		model.addAttribute("list",musicService.selectMusicByTitle());
		return "view";}
		catch(Exception e) {
			return "failed";
		}
	
}
    
}
