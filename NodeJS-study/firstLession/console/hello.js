#!/usr/bin/env node


// fetch name from command or fall back 

const nameArg = (process.argv[2] || process.env.USER || process.env.USERNAMR || 'Priya Billi World');

console.log(`Hello ${ nameArg }`);

