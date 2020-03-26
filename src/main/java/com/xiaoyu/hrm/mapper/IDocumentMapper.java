package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.Document;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 文件 增删改查
 *
 * @author xiaoyu
 * @date 2020/3/26 14:12
 */
public interface IDocumentMapper {

    /**
     * 根据条件查询文档，条件可有可无
     *
     * @param page 页码
     * @param size 每页行数
     * @param document 条件
     * @return 返回用户信息
     */
    List<Document> findAllDocument(@Param("page") Integer page,
                                   @Param("size") Integer size,
                                   @Param("document") Document document);

    /**
     * 根据id查询文件信息
     * @param id id
     * @return 返回查询的信息
     */
    @Select("select * from document_inf where id = #{id}")
    Document findDocumentById(Integer id);

    /**
     * 根据条件查询文档，条件可有可无
     * @param document 条件（title）
     * @return 返回查询的结果
     */
    Long getTotal(@Param("document") Document document);

    /**
     * 上传文档同时向数据库保存相关信息
     * @param document 信息
     * @return 返回影响行数
     */
    int insertDocument(Document document);

    /**
     * 更新文档信息
     * @param document 文档信息
     * @return 返回影响行数
     */
    @Update("update document_inf set title = #{title}, remark = #{remark} where id = #{id}")
    int updateDocument(Document document);

    /**
     * 更新id删除文档
     * @param id id
     * @return 返回影响行数
     */
    @Delete("delete from document_inf where id = #{id}")
    int deleteDocumentById(Integer id);

}
