#!/bin/bash
set -e
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$_CURRENT_FILE_DIR"

# MODIFY THIS TO SETUP AVAILABLE DEBIAN VERSION
DEBIAN_VERSION_LIST="squeeze 6 wheezy 7 jessie 8"



# SPECIFIC FUNCTIONS ----------------------------
function update_dockerfile() {
	local path=$1
	local version=$2

	sed -i .bak -e "s,ENV DEBIAN_VERSION.*,ENV DEBIAN_VERSION $version," "$path"
	sed -i .bak -e "s/^FROM debian:.*/FROM debian:"$version"/" "$path"
	rm -f "$path".bak
}



# GENERIC FUNCTIONS ----------------------------
function update_readme() {
	local path=$1
	local list="$2"

	sed -i .bak -e "s/latest,.*/latest, $list/" "$path"
	rm -f "$path".bak
}









# MAIN ----------------------------


echo
echo "******** UPDATE LAST ********"
# Update last release
last_release="latest"

version_name="$last_release"
version_number="$version_name"
echo " * Process last release $version_name"
echo " ** version number : $version_number"

update_dockerfile "Dockerfile" "$version_name"

echo
echo "******** UPDATE ALL ********"
# Update all releasese
rm -Rf "ver"
releases="$DEBIAN_VERSION_LIST"

for rel in $releases; do
	version_name="$rel"
	version_number="$version_name"
	echo " * Process release $version_name"
	echo " ** version number : $version_number"

	mkdir -p "ver/$version_number"
	cp -f supervisord* "ver/$version_number"
	cp -f Dockerfile "ver/$version_number/Dockerfile"
	update_dockerfile "ver/$version_number/Dockerfile" "$version_name"
	echo
done

echo "******** UPDATE README ********"
list_release=$(echo $releases | sed -e 's/ /\, /g')

update_readme "README.md" "$list_release"

echo
echo "************************************"
echo " YOU SHOULD NOW ADD MISSING VERSION THROUGH"
echo " Docker Hub WebUI : AUTOMATED BUILD REPOSITORY"