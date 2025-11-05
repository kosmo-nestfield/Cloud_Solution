# 1. 개요  
외부 서비스 등에서 클라우드 솔루션의 데이터 읽기/쓰기 기능을 지원하는 REST API 서버입니다.  
기본적으로 7770번 포트를 사용하므로, 외부 접근 시 해당 포트를 방화벽 설정에서 허용해주셔야합니다.  

# 2. 사용 방법  
본 레포지토리에 업로드된 인터페이스 규격 문서를 참고해주세요.  

# 3. 설치 방법  

### - AMQP 계정 생성  
```
rabbitmqctl add_user restapi restapi  
rabbitmqctl set_user_tags restapi management  
rabbitmqctl set_permissions -p / restapi ".*" ".*" ".*"  
```
### - 필요 Python 패키지 설치  
```
python -m pip install pika
python -m pip install flask  
```
### - REST API 파일 및 서비스 설치
```
wget https://github.com/kosmo-nestfield/Cloud_Solution/raw/main/Cloud%20Ver2.0/restapi/restapi.tar  
tar xvf restapi.tar  
mv restapi.py restapi.sh /opt/bin  
mv restapi.service /usr/lib/systemd/system/
systemctl daemon-reload  
systemctl enable restapi.service  
systemctl restart restapi.service  
```
  
