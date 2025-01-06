import std::io;
import std::collections::list;
import std::sort;

const String FILENAME = "input.txt";

fn void main() {
    io::printn("AOC2 with c3!");

    String! buffer = (String)io::file::load_new(FILENAME);
    if (catch err = buffer) {
	io::printfn("Could not load file %s", FILENAME);
	return;
    }
    
    String[] levels = buffer.split("\n");
    
    uint result;
    foreach(level : levels) {
	List(<int>) level_list; // C3 have the concept of a tempory allocation, does this list allocated on the heap, and need to be freed at scopes end, or it is temporary(scoped) by default? if not can I set it as temporary?

	String[] level_report = level.tsplit(" ");
        foreach(c : level_report){
	    if (c) { // There is something weird here with the behavior of trim in c3. It adds an "extra" unexpected null value at the end of the string array...
	        level_list.push(c.to_uint())!!;
	    }
	}
	
	if (is_sorted(level_list)) {
	    // check distance between reports.
	} else {
	    // Do nothing
	}
    }
    
}
