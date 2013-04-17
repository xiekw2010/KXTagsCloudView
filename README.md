KXTagsCloudView
===============

give it a array of string, it will feed back a cloud of tags

It's fearture:

1. The tags'font in the cloud will adjust automatically according to the cloud view.

2. The tags in the cloud view never accross the bounds of the could view.

3. Just use the - (id)initWithFrame:(CGRect)frame withTagsArray:(NSArray *)tagsArray will setup the tags view
    or user the - (void)customTheLayoutWithArray:(NSArray *)tagsArray will reset the tags view content.

4.It will listen the touch event on the tags.

![iPhone](/TagsCloudView/iPhone1.png)

![iPad](/TagsCloudView/ipad1.png)
