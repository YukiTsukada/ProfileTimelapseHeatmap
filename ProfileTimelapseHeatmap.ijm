Num = nSlices;
rename("window");
openDir = getDirectory("Choose a Directory");
Table.create("heat");

// plot profile for all slices and put them into a table
for (i = 1; i < Num; i++) {
	selectWindow("window");
	setSlice(i);
	run("Plot Profile");
	Plot.getValues(x, y);
	Table.setColumn(i, y);	
	close();
}
Table.update;

// save results
path = openDir + "/test.txt";
Table.save(path);
openpath = "open="+path;

// show heat map
run("Text Image... ", openpath);
run("physics");
  