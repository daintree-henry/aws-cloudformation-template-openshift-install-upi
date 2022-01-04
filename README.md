subscription-manager register --auto-attach –force

yum install wget unzip

1)	aws cli 설치
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

2)	oc 설치
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.6.9/openshift-client-linux-4.6.9.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.6.9/openshift-install-linux-4.6.9.tar.gz

tar xvf ~
3)	인증서 생성
ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_rsa


4) ign 파일 생성 및 s3업로드

aws s3 mb s3://<cluster-name>-infra 
aws s3 cp bootstrap.ign s3://<cluster-name>-infra/bootstrap.ign
aws s3 ls s3://<cluster-name>-infra/

1) 설치 진행
 
mkdir cloudformation && cd cloudformation

git clone https://github.com/daintree-henry/aws-cloudformation-template-openshift-install-upi ./

#변수 작성 및 수정
cp variables_template variables
vi variables

./variable-apply.sh 02_network_params.json

aws cloudformation create-stack --stack-name cp4dnetwork --template-body file:///root/ocp4/cloudformation/02_network.yaml --parameters file:///root/ocp4/cloudformation/02_network_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dnetwork

#Network 관련 ARN값, HostedZoneID 입력
vi variables

./variable-apply.sh 03_security_params.json

aws cloudformation create-stack --stack-name cp4dsg --template-body file:///root/ocp4/cloudformation/03_security.yaml --parameters file:///root/ocp4/cloudformation/03_security_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dsg

#SG값,InstanceProfileName 입력
vi variables

./variable-apply.sh 04_bootstrap_params.json

aws cloudformation create-stack --stack-name cp4dbootstrap --template-body file:///root/ocp4/cloudformation/04_bootstrap.yaml --parameters file:///root/ocp4/cloudformation/04_bootstrap_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dbootstrap

./variable-apply.sh 05_master_params.json

aws cloudformation create-stack --stack-name cp4dmaster --template-body file:///root/ocp4/cloudformation/05_master.yaml --parameters file:///root/ocp4/cloudformation/05_master_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dmaster

./variable-apply.sh 06_worker_params.json

aws cloudformation create-stack --stack-name cp4dworker1 --template-body file:///root/ocp4/cloudformation/06_worker.yaml --parameters file:///root/ocp4/cloudformation/06_worker_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dworker1

aws cloudformation create-stack --stack-name cp4dworker2 --template-body file:///root/ocp4/cloudformation/06_worker.yaml --parameters file:///root/ocp4/cloudformation/06_worker_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dworker2

aws cloudformation create-stack --stack-name cp4dworker3 --template-body file:///root/ocp4/cloudformation/06_worker.yaml --parameters file:///root/ocp4/cloudformation/06_worker_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dworker3

aws cloudformation create-stack --stack-name cp4dworker1 --template-body file:///root/ocp4/cloudformation/06_worker.yaml --parameters file:///root/ocp4/cloudformation/06_worker_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dworker4

aws cloudformation create-stack --stack-name cp4dworker1 --template-body file:///root/ocp4/cloudformation/06_worker.yaml --parameters file:///root/ocp4/cloudformation/06_worker_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dworker5

aws cloudformation create-stack --stack-name cp4dworker6 --template-body file:///root/ocp4/cloudformation/06_worker.yaml --parameters file:///root/ocp4/cloudformation/06_worker_params.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation describe-stacks --stack-name cp4dworker6
