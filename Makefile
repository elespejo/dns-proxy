GITBOOK = $(CURDIR)/gitbook
DOCS = $(CURDIR)/docs
IMAGE_ENV = $(CURDIR)/image
DF = $(IMAGE_ENV)/Dockerfile
DEPLOYMENT = $(CURDIR)/deployment
OWNER = elespejo
REPO = dns-proxy

.PHONY: mk-book clean-book
mk-book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)

clean-book:
	rm -rf $(DOCS)/*

.PHONY: mk-image clean-image
mk-image:
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker build -t $(OWNER)/$(REPO)-$(ARCH) -f $(DF)-$(ARCH) $(IMAGE_ENV) 

clean-image:
	docker rmi $(OWNER)/$(REPO)-$(ARCH)


.PHONY: mk-imageAPI-x86 mk-confgenerator mk-deployment clean-deployment
mk-imageAPI-x86: $(DEPLOYMENT)/imageAPI-x86
	mkdir $(REPO)-imageAPI
	cp $(DEPLOYMENT)/imageAPI-x86/* $(REPO)-imageAPI/
	sed -i s+VERSION=.*+VERSION=$(VERSION)+g $(REPO)-imageAPI/temp.env
	zip -r $(REPO)-imageAPI-x86-$(VERSION).zip $(REPO)-imageAPI
	rm -rf $(REPO)-imageAPI

mk-confgenerator: $(DEPLOYMENT)/confgenerator
	mkdir $(REPO)-confgenerator
	cp -r $(DEPLOYMENT)/confgenerator/* $(REPO)-confgenerator/
	zip -r $(REPO)-confgenerator-$(VERSION).zip $(REPO)-confgenerator
	rm -rf $(REPO)-confgenerator

mk-deployment: mk-imageAPI-x86 mk-confgenerator

clean-deployment: 
	rm $(REPO)-imageAPI-x86-$(VERSION).zip
	rm $(REPO)-confgenerator-$(VERSION).zip


.PHONY: pushtohub
pushtohub:
	docker tag $(OWNER)/$(REPO)-$(ARCH) $(OWNER)/$(REPO)-$(ARCH):$(TAG)
	docker login -u $(USER) -p $(PASS)
	docker push $(OWNER)/$(REPO)-$(ARCH):$(TAG)
