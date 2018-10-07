echo "build and pushing docker image"
# build and push an image for rails
docker build ./rails/ -t nuxt_on_rails_on_docker_rails
cp ./rails/Dockerfile ./rails/Dockerfile.development
cp -f production/rails/Dockerfile ./rails/Dockerfile
docker build ./rails/ -t gcr.io/gke-sample-201809/nuxt-rails-gke-sample
mv -f ./rails/Dockerfile.development ./rails/Dockerfile
docker push gcr.io/gke-sample-201809/nuxt-rails-gke-sample

# build and push an image for nuxt
cp -f production/nuxt/Dockerfile ./nuxt/Dockerfile
docker build ./nuxt/ -t gcr.io/gke-sample-201809/nuxt-rails-gke-sample-nuxt
rm -f ./nuxt/Dockerfile
docker push gcr.io/gke-sample-201809/nuxt-rails-gke-sample-nuxt

echo "beginnng deployment"
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete services --all
kubectl create -f production/rails/deploy.yml
kubectl create -f production/rails/service.yml
kubectl create -f production/nuxt/deploy.yml
kubectl create -f production/nuxt/service.yml

echo ""
echo "--- deployment complete! ---"
kubectl get pods
kubectl get services
