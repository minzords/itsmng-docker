CTN=`which podman >/dev/null 2>&1 && echo podman || echo docker`
IMAGENAME=itsm-ng
ACCOUNT=minzords
VERSION=latest

itsmng:
	$(CTN) build -t $(IMAGENAME):$(VERSION) .

prod:
	$(CTN) build -t docker.io/$(ACCOUNT)/$(IMAGENAME):$(VERSION) .
	echo "Please login to docker.io to push the image"
	$(CTN) login docker.io
	$(CTN) push docker.io/$(ACCOUNT)/$(IMAGENAME):$(VERSION)

clean:
	$(CTN) rmi -f $(IMAGENAME):$(VERSION)