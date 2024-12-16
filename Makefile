REGION=<REGION>
AWS_ACCOUNT_ID=<AWS_ACCOUNT_ID>
SAMPLE_APP_NAME=fastapi-sample
TAG=latest
ECR_REPO_NAME:=<EKS_REPO_NAME>


.PHONY:publish-image
publish-image:
	# sampleイメージをamd64アーキテクチャでビルドして、ECRリポジトリにpush
	docker buildx build --platform linux/amd64 -t ${SAMPLE_APP_NAME}:${TAG} --load .
	aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com
	docker tag ${SAMPLE_APP_NAME}:${TAG} ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${ECR_REPO_NAME}:${TAG}
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${ECR_REPO_NAME}:${TAG}
