package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.bean.Music;

public interface MusicService {
	public void insertMusic(Music music);
	public List<Music> selectMusic();
	public List<Music> selectMusicByArtist();
	public List<Music> selectMusicByTitle();
	public void updateMusic(Music music);
	public void deleteMusic(int num);
	public Music selectMusicById(int num);

}
