NAMESPACE	= medcury
REPO		= moph-proxy-api
BUILDDIR	= .
VERSION= $(shell cat package.json | grep version | head -1 | awk -F= "{ print $2 }" | sed 's/[version:,\",]//g' | tr -d '[[:space:]]')
IMAGE =$(NAMESPACE)/$(REPO):$(VERSION)


dotenv:
	cp .env.example .env
	
bootstrap: dotenv
	npm i

start:
	node index

start-pm2:
	pm2 start ecosystem.config.js

stop-pm2:
	pm2 stop ecosystem.config.js

build: Dockerfile
	@echo "+\n++ Performing build of Docker image $(IMAGE)...\n+"
	@docker build -t $(IMAGE) --no-cache=true --force-rm --rm $(BUILDDIR)

docker-run: build
	@docker run -d -p 8080:80 $(IMAGE)
