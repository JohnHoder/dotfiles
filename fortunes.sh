#####
# INSTALL FORTUNES-FR
#####

wget https://www.fortunes-fr.org/fortunes-fr/fortunes-fr-0.02.tar.gz -O fortunes-fr.tar.gz
tar -zxvf fortunes-fr.tar.gz
cd fortunes-fr-0.02 && ./configure && make && make install
rm -rf fortunes-fr.tar.gz fortunes-fr-0.02/

echo "fortunes-fr should be now installed"
