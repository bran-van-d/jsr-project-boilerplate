import { exec } from 'child_process';

// Replace 'myscript.sh' with the path to your Bash script
const bashScriptPath = './get-jsr-module.sh';

// Run the Bash script using Node.js
const child = exec(`bash ${bashScriptPath}`, (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing the script: ${error}`);
    return;
  }
  console.log(`Script output: ${stdout}`);
  console.error(`Script errors: ${stderr}`);
});

child.on('exit', (code) => {
  console.log(`Script execution exited with code ${code}`);
});
