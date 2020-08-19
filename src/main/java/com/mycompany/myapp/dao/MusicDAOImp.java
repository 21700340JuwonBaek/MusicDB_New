package com.mycompany.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.bean.Music;
@Repository
public class MusicDAOImp implements MusicDAO {
	@Autowired
	SqlSession SQLSession;
	private static final String LISTSQL = "music.Select";
	private static final String INSERT = "music.Insert";
	private static final String UPDATE = "music.Update";
	private static final String DELETE = "music.Delete";
	private static final String SELECT = "music.SelectById";
	@Override
	public void insertMusic(Music musics) {

		SQLSession.insert(INSERT,musics);
	}

	@Override
	public List<Music> selectMusic() {
		// TODO Auto-generated method stub
		return SQLSession.selectList(LISTSQL);
	}

	@Override
	public void updateMusic(Music music) {
		System.out.println("DAO에서  id : " + music.getId() + "인 " + music.getArtist() +"노래를 수정");
		SQLSession.update(UPDATE,music);
	}

	@Override
	public void deleteMusic(int num) {
		SQLSession.delete(DELETE,num);
	}

	@Override
	public Music selectMusicById(int num) {
		// TODO Auto-generated method stub
		System.out.print(num+"at DAO");
		return SQLSession.selectOne(SELECT, num);

	}

}
