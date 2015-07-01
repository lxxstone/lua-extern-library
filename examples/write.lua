require "rapidxml"

--从字符串创建根节点
local doc = rapidxml.parse( [[<testDoc/>]] )
local root = doc:root()

--插入节点
for i = 1, 5 do
    local child = root:append( "testText" )
    child:set_attr( "index", "10000" )
    child:set_text( tostring( i * 10 ) )
end

--插入一级节点
local child = root:append( "testNode")
child:set_attr( "index", "10000" )

--插入二级节点带属性
local child1 = child:append( "1111111" )
child1:set_attr( "index", "10000" )
child1:set_text( tostring(1000 ) )

--插入二级节点带多个属性
local child2 = child:append( "1111111" )
child2:set_attr("index", "10000" )--设置节点属性
child2:set_attr("name", "stone" )
child2:set_text( tostring(1000) )--设置节点数据

child2 = child:append( "1111111" )
child2:set_attr("index", "10000" )
child2:set_text( tostring(1000 ) )

--移除指定节点
child:remove(child1)

--删除某个节点下拥有特定的值的子节点，可扩展
function remove_node(root)
    local child = nil;
    for k,v in pairs(root:children()) do
	if v:type() == rapidxml.node_element then
	    if v:name() == "testText" then
		if v:text() == "20" then
		    print( v:name(), v:text() )
		    child = v;
		    break;
		end
	    end
	end
    end
    if child ~= nil then
	root:remove(child)
    end
end
remove_node(root)

--获取xml字符串
local tmp = doc:xml()
print("##########")
print(tmp)
print("##########")

