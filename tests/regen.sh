#!/bin/sh

# Regen .rev files (only for the symbol main !)
# otherwise specifial cases at the end

cd ..

if [ "$1" == "force" ]; then
  ls tests/*.bin | while read file; do
      name=`basename "$file" .bin`
     ./run_plasma.py --nosectionsname --nocolor "tests/${name}.bin" >"tests/${name}.rev"
  done

  mv tests/server.rev tests/server_main.rev
  ./run_plasma.py tests/server.bin -x=connection_handler -ns -nc >tests/server_connection_handler.rev

  mv tests/pendu.rev tests/pendu__main.rev
  ./run_plasma.py tests/pendu.bin -x=___main -ns -nc >tests/pendu____main.rev
  ./run_plasma.py tests/pendu.bin -x=__imp___cexit -ns -nc >tests/pendu___imp___cexit.rev

else
    echo "Are you sure ?"
    echo "if yes add 'force' in argument"
fi
