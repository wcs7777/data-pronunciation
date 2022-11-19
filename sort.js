const { readFile, writeFile } = require('node:fs/promises');

(async () => {
	if (process.argv.length > 2) {
		const path = process.argv[2];
		await writeFile(
			path,
			object2json(sortObjectKeys(await file2object(path))),
		);
		return `${path} sorted`;
	} else {
		return 'Please, inform the path!';
	}
})()
	.then(console.log)
	.catch(console.error);

function file2object(path) {
	return readFile(path)
		.then((buffer) => buffer.toString())
		.then((text) => JSON.parse(text));
}

function object2json(obj) {
	return JSON.stringify(obj, null, '\t');
}

function sortObjectKeys(obj) {
	return Object
		.entries(obj)
		.sort(([left], [right]) => {
			return (
				left > right ? 1 :
				left < right ? -1 : 0
			);
		})
		.reduce((obj, [key, value]) => {
			obj[key] = value;
			return obj;
		}, {});
}
