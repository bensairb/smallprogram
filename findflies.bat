@echo "����Ѱ���ļ�"
@echo "��getname.txt���б�Ϊ�ؼ��֣�����Ϊ�ָ���"
@echo "Ѱ��·����result.txt"
@echo "Ѱ�ҽ����picresult��"
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