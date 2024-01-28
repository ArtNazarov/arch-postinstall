cd ~
echo "REMOVE PLASMA? [Y/N]?"
echo "Confirm [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then



sudo pacman -Rsn kaccounts-integration 
sudo pacman -Rsn kcolorpicker           
sudo pacman -Rsn kdf                    
sudo pacman -Rsn kidletime              
sudo pacman -Rsn knewstuff              
sudo pacman -Rsn kservice
sudo pacman -Rsn kactivities            
sudo pacman -Rsn kcompletion            
sudo pacman -Rsn kdnssd                 
sudo pacman -Rsn kimageannotator        
sudo pacman -Rsn knotifications         
sudo pacman -Rsn ktexteditor
sudo pacman -Rsn kactivities-stats      
sudo pacman -Rsn kconfig                
sudo pacman -Rsn kdoctools              
sudo pacman -Rsn kinit                  
sudo pacman -Rsn knotifyconfig          
sudo pacman -Rsn ktextwidgets
sudo pacman -Rsn kapidox                
sudo pacman -Rsn kconfigwidgets      
sudo pacman -Rsn kio                    
sudo pacman -Rsn kpackage               
sudo pacman -Rsn kup
sudo pacman -Rsn karchive               
sudo pacman -Rsn kcontacts             
sudo pacman -Rsn kirigami2              
sudo pacman -Rsn kparts                 
sudo pacman -Rsn kuserfeedback
sudo pacman -Rsn kauth                  
sudo pacman -Rsn kcoreaddons            
sudo pacman -Rsn kfilemetadata          
sudo pacman -Rsn kitemmodels            
sudo pacman -Rsn kpimtextedit           
sudo pacman -Rsn kwallet
sudo pacman -Rsn kcrash                 
sudo pacman -Rsn kglobalaccel           
sudo pacman -Rsn kitemviews             
sudo pacman -Rsn kpmcore                
sudo pacman -Rsn kwayland
sudo pacman -Rsn kbookmarks             
sudo pacman -Rsn kdav                   
sudo pacman -Rsn kguiaddons             
sudo pacman -Rsn kjobwidgets            
sudo pacman -Rsn kpty                   
sudo pacman -Rsn kwidgetsaddons
sudo pacman -Rsn kcalendarcore          
sudo pacman -Rsn kdbusaddons            
sudo pacman -Rsn kholidays              
sudo pacman -Rsn kjs                    
sudo pacman -Rsn krb5                   
sudo pacman -Rsn kwindowsystem
sudo pacman -Rsn kcmutils               
sudo pacman -Rsn kdeclarative           
sudo pacman -Rsn ki18n                 
sudo pacman -Rsn kmime                  
sudo pacman -Rsn kross                  
sudo pacman -Rsn kxmlgui
sudo pacman -Rsn kcodecs                
sudo pacman -Rsn kded                   
sudo pacman -Rsn kiconthemes           
sudo pacman -Rsn kmod                   
sudo pacman -Rsn krunner    


# sudo pacman -Sy sddm
sudo pacman -Rsn plasma
sudo pacman -Rsn plasma-meta
sudo pacman -Rsn plasma-wayland-session
sudo pacman -Rsn kde-applications
sudo pacman -Rsn kde-gtk-config

else
        echo "skipped PLASMA remove"
fi

cd -
