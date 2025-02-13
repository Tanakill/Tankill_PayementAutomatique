fx_version 'cerulean'
game 'rdr3'

author 'Tanakill'
description 'Script de paiement automatique pour les médecins et les shériffs avec notifications'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
version '1.0.0'

server_script {

    '@mysql-async/lib/MySQL.lua',
    'payement_auto.lua'

}

dependencies {
    'vorp_core',
    'mysql-async'


}
