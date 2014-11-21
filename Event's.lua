-- Created by Squalleze --
arg1 = 'Tigrounette'
arg2 = true
arg3 = 'Private Messages'
print(string.format('<a href="event:clicTexteNomJoueurEvent;joueur=%s&online=%s" class="auteur">%s<tab>◄</a>', arg1, tostring(arg2), arg1))
print(string.format('<a href="event:MP" class="auteur">%s</a>', arg3))
