source variables

sed -i "s/VAR_CLUSTER_NAME/$VAR_CLUSTER_NAME/g" $1
sed -i "s/VAR_INFRA_NAME/$VAR_INFRA_NAME/g" $1
sed -i "s/VAR_DOMAIN/$VAR_DOMAIN/g" $1
sed -i "s/VAR_PRIVATE_SUBNET_ID/$VAR_PRIVATE_SUBNET_ID/g" $1
sed -i "s/VAR_VPC_ID/$VAR_VPC_ID/g" $1
sed -i "s/VAR_VPC_CIDR/$VAR_VPC_CIDR/g" $1
sed -i "s/VAR_RHCOS_AMI/$VAR_RHCOS_AMI/g" $1
sed -i "s/VAR_BOOTSTRAP_IGN_FILE/$VAR_BOOTSTRAP_IGN_FILE/g" $1
sed -i "s/VAR_MASTER_INSTANCE_TYPE/$VAR_MASTER_INSTANCE_TYPE/g" $1
sed -i "s/VAR_WORKER_INSTANCE_TYPE/$VAR_WORKER_INSTANCE_TYPE/g" $1
sed -i "s/VAR_CA/$VAR_CA/g" $1
sed -i "s/VAR_NLB_LAMBDA_ARN/$VAR_NLB_LAMBDA_ARN/g" $1
sed -i "s/VAR_APITARGET_ARN/$VAR_APITARGET_ARN/g" $1
sed -i "s/VAR_SERVICETARGET_ARN/$VAR_SERVICETARGET_ARN/g" $1
sed -i "s/VAR_HOSTED_ZONE_ID/$VAR_HOSTED_ZONE_ID/g" $1
sed -i "s/VAR_MASTER_SG_ID/$VAR_MASTER_SG_ID/g" $1
sed -i "s/VAR_MASTER_SG_ID/$VAR_MASTER_SG_ID/g" $1