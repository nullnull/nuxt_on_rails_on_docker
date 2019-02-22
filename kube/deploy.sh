echo "build and pushing docker image"

rm -fr ./rails/log/*
rm -fr ./rails/tmp/*

# build and push an image for rails
docker build ./rails/ -t nuxt_on_rails_on_docker_rails
cp ./rails/Dockerfile ./rails/Dockerfile.development
cp -f kube/rails/Dockerfile ./rails/Dockerfile
docker build ./rails/ -t gcr.io/gke-sample-201809/nuxt-rails-gke-sample
mv -f ./rails/Dockerfile.development ./rails/Dockerfile
docker push gcr.io/gke-sample-201809/nuxt-rails-gke-sample

# build and push an image for nuxt
cp -f kube/nuxt/Dockerfile ./nuxt/Dockerfile
docker build ./nuxt/ -t gcr.io/gke-sample-201809/nuxt-rails-gke-sample-nuxt
rm -f ./nuxt/Dockerfile
docker push gcr.io/gke-sample-201809/nuxt-rails-gke-sample-nuxt

echo "beginnng deployment"
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete services --all
kubectl create -f kube/rails/deploy.yml
kubectl create -f kube/rails/service.yml
kubectl create -f kube/nuxt/deploy.yml
kubectl create -f kube/nuxt/service.yml

echo ""
echo "--- deployment complete! ---"
kubectl get pods
kubectl get services
