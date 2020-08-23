package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.bean.Music;
import com.mycompany.myapp.dao.MusicDAO;


@Service
public class MusicServiceImp implements MusicService {
	@Autowired
	MusicDAO musicDAO;
	
	@Override
	public void insertMusic(Music music) {
		musicDAO.insertMusic(music);
	}

	@Override
	public List<Music> selectMusic() {
		// TODO Auto-generated method stub
		return musicDAO.selectMusic();
	}

	@Override
	public void updateMusic(Music music) {
		// TODO Auto-generated method stub
		musicDAO.updateMusic(music);
	}

	@Override
	public void deleteMusic(int num) {
		// TODO Auto-generated method stub
		musicDAO.deleteMusic(num);
	}

	@Override
	public Music selectMusicById(int num) {
		// TODO Auto-generated method stub
		return musicDAO.selectMusicById(num);
	}

	@Override
	public List<Music> selectMusicByArtist() {
		// TODO Auto-generated method stub
		return musicDAO.selectMusicByArtist();
	}

	@Override
	public List<Music> selectMusicByTitle() {
		// TODO Auto-generated method stub
		return musicDAO.selectMusicByTitle();
	}

}