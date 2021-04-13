# 1. 개요  
본 Repository는 클라우드에서 엣지 게이트웨이의 제조 데이터들을 수집해 활용하는 프로세스의 설치 방법에 대하여 설명합니다.
  
# 2. 솔루션 설치 권장사양 및 파일 설명  
클라우드 솔루션은 NHN Toast 클라우드에서 인스턴스를 생성하여 개발 및 테스트를 진행하였습니다.  
상세한 설치 환경 및 방법은 [**클라우드 설치 매뉴얼**](https://github.com/kosmo-nestfield/Cloud_Solution/blob/main/%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C%20%EC%88%98%EC%A7%91%20%EB%B0%8F%20%EC%A0%80%EC%9E%A5%20%EA%B5%90%EC%9C%A1.pptx) 파일을 참고해주시기 바랍니다.  
  
## VM 권장 사양  
* Processor : vCPU 8  
* Memory : 32GB DRAM  
* Disk :  
  \- Root 파일시스템 : 100GB  
  \- 시계열DB 저장용 스토리지 : 400GB  
  \- 백업용 블록 스토리지 : 1TB  
* OS : Ubuntu 18.04 LTS  
    
## 파일 목록 및 설명  
본 Repository에는 총 4개의 압축(.tgz)파일과 하나의 PPT 파일이 있으며, 그 내용은 아래와 같습니다.  
> * [**etc_config.tgz**](https://github.com/kosmo-nestfield/Cloud_Solution/blob/main/etc_config.tgz)  
>   \- 솔루션 구성 시 필요한 mysql, influxdb, grafana의 설정파일입니다. 각 파일을 설치 매뉴얼 PPT에 나온 디렉토리에 그대로 복사하시면 됩니다.  
> * [**install.tgz**](https://github.com/kosmo-nestfield/Cloud_Solution/blob/main/install.tgz)  
>   \- 솔루션 설치용 쉘 스크립트입니다. 각 컴포넌트들을 쉘 스크립트 실행을 통해 바로 설치할 수 있으며, 아래 명령어를 통해 전체 파일 설치를 한번에 하실 수 있습니다.
> ```
> /root/ 디렉토리 아래에 설치용 쉘 스크립트들을 위치시킨 후 ./install_all.sh 명령어 실행  
> ```
> * [**opt.tgz**](https://github.com/kosmo-nestfield/Cloud_Solution/blob/main/opt.tgz)  
>   \- 본 솔루션에서 핵심이 되는 실행파일, 설정파일, 로그 디렉토리, 웹 스크립트 파일이 포함된 압축파일입니다.  
>   \- 루트 디렉토리(/) 아래에 압축을 해제하시면 됩니다.  
> * [**service.tgz**](https://github.com/kosmo-nestfield/Cloud_Solution/blob/main/service.tgz)  
>   \- Linux 시스템 서비스에 솔루션 실행파일을 등록시키기 위한 파일입니다.  
>   \- /etc/systemd/system/ 디렉토리 아래에 파일들을 위치시키면 후에 service 명령어를 통해 실행파일들의 상태 모니터링 및 실행/종료가 가능합니다.  
>  
> * [**클라우드 수집 및 저장 교육.pptx**](https://github.com/kosmo-nestfield/Cloud_Solution/blob/main/%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C%20%EC%88%98%EC%A7%91%20%EB%B0%8F%20%EC%A0%80%EC%9E%A5%20%EA%B5%90%EC%9C%A1.pptx)  
>   \- NHN Toast 클라우드 가입, 인스턴스 생성부터 데이터의 시각화 및 모니터링 방법까지 설치 및 실행 방법이 설명된 PPT 문서입니다.  
>   \- 본 솔루션 구축 시 해당 문서를 참고하셔서 설치를 진행하시면 됩니다.  

  
