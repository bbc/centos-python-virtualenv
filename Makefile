.PHONY: rpmbuild mock clean

rpmbuild: clean
	mbt --buildstyle=rpmbuild

mock: clean
	mbt

clean:
	rm -rf BUILD SRPMS RPMS BUILDROOT

# Intended for testing on sandbox
install: rpmbuild
	sudo yum erase -y python-virtualenv
	sudo yum install -y ./RPMS/*.rpm
