<a href="http://www.tmssoftware.com/site/tmsfncuipack.asp"><img src="https://tmssoftware.com/site/img/github/tmsfncuipack.png" title="TMS FNC UI Pack" alt="TMS FNC Cloud Pack"></a>
# Category List #
Please follow the steps below to get started with the Category List, after following the <a href="https://github.com/tmssoftware/TMS-FNC-UI-Pack/blob/master/README.md">main</a> steps to install the components in the IDE.
<ol>
  <li>Drop an instance of TTMSFNCCategoryList on the form</li>  
  <li>Drop an instance of TTMSFNCBitmapContainer on the form</li>
  <li>Add items to the TTMSFNCBitmapContainer instance</li>
  <li>Use the following code to initialize the list</li>
  
  ```delphi
  procedure TForm1.InitializeCategoryList;
  var
    cat: TTMSFNCCategoryList;
    I: Integer;
  begin
    cat := TTMSFNCCategoryList.Create(Self);
    cat.BitmapContainer := TMSFNCBitmapContainer1;
    cat.Parent := Self;
    cat.Mode := clmHorizontal;
    for I := 0 to TMSFNCBitmapContainer1.ItemCount - 1 do
      cat.AddCategoryItem(TMSFNCBitmapContainer1.Items[I].Name);
   end;
  ``` 
</ol>

<img src="https://www.tmssoftware.com/site/img/github/tmsfnccategorylist.png"/>

### Assigning a popup or embedded control ###
<ol>
  <li>Drop an instance of any visual control you wish to show when clicking on an item on the form</li>
  <li>Assign the visual control to the PopupControl property of the category list item</li>
  
  ```delphi
  procedure TForm1.InitializeCategoryList;
  var
    cat: TTMSFNCCategoryList;
    it: TTMSFNCCategoryListItem;
  begin
    cat := TTMSFNCCategoryList.Create(Self);
    cat.BitmapContainer := TMSFNCBitmapContainer1;
    cat.Parent := Self;
    cat.Mode := clmHorizontal;

    it := cat.AddCategoryItem('Calendar.png');
    it.PopupControl := TMSFNCCalendar1;
    it.PopupMode := ipmPopupControlSize;

    cat.AddCategoryItem('Recycle Bin.png');
    cat.AddCategoryItem('Home.png');
    cat.AddCategoryItem('Print.png');
  end;
  ```
</ol>

<img src="https://www.tmssoftware.com/site/img/github/tmsfnccategorylist2.png"/>
