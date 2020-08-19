package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.bean.Music;

public interface MusicDAO {
	public void insertMusic(Music music);
	public List<Music> selectMusic();
	public void updateMusic(Music music);
	public void deleteMusic(int num);
	public Music selectMusicById(int num);
}
