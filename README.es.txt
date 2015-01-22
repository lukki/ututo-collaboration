Uso del KIT de desarrollo de UTUTO XS

- editar el erchivo "compile.list/compile.list.pkg"
- poner en este el los paquetes que se van a compilar en la misma linea y dejando un espacio entre los nombres
  EJ.: kde-meta lxde-meta gimp
- ejecutar el script "00-compile-list.sh". Este scripot buscara las dependencias y creara los scripts para compilar
  el/los paquete/s. Seran creados dentro de "compile.list" conteniendo el nombre del paquete como final del nombre
  del archivo. Un "compile.list.XXXXX" por cada paquete a compilar
- ejecutar "01-compile-all.sh" para crear los binarios que seran puestos en el directorio "packages"
  separados por optimizacion. Si el proceso da errores se detendra y esperara al usuario.
- ejecute "03-busca-deps.sh" para crear los pre-archivos para uget para cada paquete con sus dependencias que 
  se crearan en el directorio "scripts"
- ejecute "04-crea-uget.sh" para crear los archivos de paquetes-recetas para Uget
- Para crear un backup de lo compilado y poner el KIT en el modo inicial ejecute "05-fin-kit-proceso.sh"


UTUTO XS Devel Team
