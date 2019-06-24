需要详细学习的包
import org.apache.commons.lang3.StringUtils;
com.google.common（例如：com.google.common.collect.Lists）
----------------------------------------------------------
键重复的处理
 <select id="selectClasssById" resultMap="classsid" >
       select classs.* , user.id 'userid' ,user.age 'age', user.name 'name',user.phone 'phone' ,user.classs_id 'classs_id' FROM classs, USER WHERE classs.id=user.classs_id 
 </select>
    <resultMap id="classsid" type="mybatis.Classs">  
	    <id property="id" column="id"/>  
	    <result property="classs_name" column="classs_name"/>  
	    <result property="grade" column="grade"/>   
	    <collection property="user" column="user.id" ofType="mybatis.User">  
	        <id property="id" column="userid"/>  
	        <result property="name" column="name"/>  
	        <result property="sex" column="sex"/> 
	        <result property="age" column="age"/>
	        <result property="phone" column="phone"/>
	        <result property="classs_id" column="classs_id"/> 
	    </collection>  
	</resultMap>
如果两张表的字段相同，那么后一张表中的相同字段命名方式——以id为例，order id  - user id   userid
												   oid        oid  user_oid
----------------------------------------------------------

----------------------------------------------------------
材料板块

材料可以流程创建，也可以手动创建
	1，创建材料页面
		a，vo(getter-setter)接收页面信息，bean校验-400错误，字段名称匹配出问题
		b，防止重复提交
		c，对应的productservice进行材料批量添加
	2，材料分页显示
		a，resultmap对应对象需要创建带参数的构造函数
		b，未到库材料status值为0，到库材料status值为1
		
		


----------------------------------------------------------
库存逻辑
	1，多选入库，批量填写入库质检信息，显示入库时间
	2，单选出库，钢材出库绑定钢锭未启动材料
	3，两张表联合呈现，一张记录完整库存记录，一张做信息变更操作
	4，可以随时更改库存中的存储信息
	5，增加余料功能，延用材料模块中的钢材创建模块






















