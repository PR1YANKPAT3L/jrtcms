package com.jrtcms.web.service;

import java.util.List;

import com.jrtcms.web.model.PhraseLibraryMD;
import com.jrtcms.web.pojo.PhraseLibrary;

public interface PhraseLibraryService {
	/**
	 * 添加词组
	 * @param pl
	 */
	String  add (PhraseLibrary pl);
	/**
	 * 修改词组信息
	 * @param pl
	 * @return
	 */
	String updatePhraseLibrary(PhraseLibrary pl) ;
	/**
	 * 查询所有的词组
	 * @return
	 */
	List<PhraseLibrary> selectAll();
	/**
	 * 分页查询所有的词组
	 * @return
	 */
	List<PhraseLibrary> selectAllFY(PhraseLibraryMD plMd );
	
}
