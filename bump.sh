
bumppackage(){
    sed -i'' '' "s/marquez>=0.[0-9]*.0/marquez>=0.${version}.0/" package.json   
    
    say "bumped to $version"
}
