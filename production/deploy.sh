
echo "build and pushing docker image"
# build and push an image for rails
docker build . -t nuxt_on_rails_on_docker_rails
cp Dockerfile Dockerfile.development
cp -f production/Dockerfile Dockerfile
docker build . -t gcr.io/gke-sample-201809/nuxt-rails-gke-sample
mv -f Dockerfile.development Dockerfile
docker push gcr.io/gke-sample-201809/nuxt-rails-gke-sample

# build and push an image for nuxt
cd nuxt
cp -f production/Dockerfile Dockerfile
docker build . -t gcr.io/gke-sample-201809/nuxt-rails-gke-sample-nuxt
rm -f Dockerfile
docker push gcr.io/gke-sample-201809/nuxt-rails-gke-sample-nuxt
cd ..

echo "beginnng deployment"
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete services --all
kubectl create -f production/deploy.yml
kubectl create -f production/rails_service.yml
kubectl create -f production/nuxt_service.yml

echo ""
echo "--- deployment complete! ---"
kubectl get pods
kubectl get services
