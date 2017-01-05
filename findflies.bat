@echo "批量寻找文件"
@echo "以getname.txt中列表为关键字，，号为分隔符"
@echo "寻找路径在result.txt"
@echo "寻找结果在picresult中"
@echo .
@echo .
@echo "------------ clear old files"
@if exist filepath.txt @del filepath.txt else @echo "--------- old files doesn't exist"
@if exist result.txt @del result.txt else @echo "--------- old files doesn't exist"
@echo "------------- loop through"
@for /R  %%s in (*) do @echo %%s >> filepath.txt
@echo "------------- loop through done"
@pause 
@echo "------------- begin to find pic"
@for /f "delims=, " %%i in (getname.txt) do @findstr ".*%%i\>" filepath.txt >>result.txt
@echo "------------- get picpath >>result.txt"
@mkdir picresult
@for /f  "delims=" %%j in (result.txt) do @copy "%%j" picresult\
@pause