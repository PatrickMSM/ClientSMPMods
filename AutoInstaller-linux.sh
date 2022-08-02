rm -rf "/tmp/ClientSMPMods"
mkdir "/tmp/ClientSMPMods"
cd "/tmp/ClientSMPMods"


echo "WARNING! THIS PROGRAM IS ONLY IN ENGLISH! "
echo ""
echo ""
echo "Welcome to ClientSMPMods AutoInstaller!"
echo "This will install ClientSMPMods AUTOMATICALLY for you!"
echo "WARNING! THIS ONLY WORKS ON WINDOWS 7 AND ABOVE!"
echo "Downloading modpack.."

wget -q --show-progress -O "/tmp/ClientSMPMods/clientmods.zip" "github.com/PatrickMSM/ClientSMPMods/raw/master/clientmods.zip"

echo "Searching for minecraft.."
if [ -d "$HOME/.minecraft" ]; then
    echo "Found Minecraft!"
else 
    echo "MINECRAFT NOT FOUND! PRESS ENTER TO EXIT"
    read
    exit
fi

echo "Expanding archive.."
unzip -qq "/tmp/ClientSMPMods/clientmods.zip" -d "/tmp/ClientSMPMods/clientmods/"
echo "WARNING! ALL OTHER MODS AND MOD SETTINGS WILL BE DELETED! PRESS ENTER TO CONTINUE!"
read
echo "Deleting all old mods and old mod settings.."
rm -rf "$HOME/.minecraft/mods"
rm -rf "$HOME/.minecraft/config"
echo "Copying over new mods and mod settings.."
mv "/tmp/ClientSMPMods/clientmods/mods" "$HOME/.minecraft/mods"
mv "/tmp/ClientSMPMods/clientmods/config" "$HOME/.minecraft/config"
echo "Cleaning up.."
rm -rf "/tmp/ClientSMPMods"
echo "Done! PRESS ENTER TO EXIT"
read
exit
