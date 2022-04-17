function stop -d "(╯°□°)--︻╦╤─ - - - kills all ports passed into func"
  for option in $argv
    set process (lsof -i :$option | grep LISTEN | awk '{ print $2 }')
    
    if test $process;
      kill -9 $process;
    else;
      echo "couldn't find port $option"; continue;
    end;

    if test (lsof -i :$option | grep LISTEN | awk '{ print $2 }'); 
      echo "couldn't kill port $option";
    else; 
      echo "killed port $option (pid: $process)";
    end;

  end;
end