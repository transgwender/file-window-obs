# file-window-obs

This filter for OBS was created to provide an overlay for stream ui elements, that can be updated dynamically and resized at any time.

![image](https://github.com/user-attachments/assets/60910e5d-a81a-41af-92b7-dd96a2cc76c1)

Generic sides can be specified in the script configuration, to be used on all layouts.

![image](https://github.com/user-attachments/assets/8f811151-46cf-4b66-b524-a20c6ac79fe6)

Special text files can then be selected for each filter, to render overtop. To create these, I personally use a python file (also attached) that takes a set of character images, and then combines them all together. But you can go about this in any way.

# NOTE

Currently, the effect assumes all ui elements (aside from the text) be a square image, and all equivalent in size.
For the text file, ensure the height of the file is the same as this value. The width can vary freely

# WARNING

My original version of this plugin had a memory leak issue. When I ported it to this public Lua filter, I cleaned up the core issues. However, I haven't fully verified that the memory leaks are fixed. Use at own discretion

# POTENTIAL IMPROVEMENTS

I may continue to refine this filter down the line, in which case the following are possible improvements I hope to do:

- Integrate python script into the GUI in order to allow for quicker setting
- Set multiple options for styles of outlines, rather than one universal outline
- Better scale control and adjustments
