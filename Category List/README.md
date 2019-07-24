<a href="http://www.tmssoftware.com/site/tmsfncuipack.asp"><img src="https://tmssoftware.com/site/img/github/tmsfncuipack.png" title="TMS FNC UI Pack" alt="TMS FNC Cloud Pack"></a>
# Category List #
Please follow the steps below to get started with the Category List, after following the <a href="https://github.com/tmssoftware/TMS-FNC-UI-Pack/blob/master/README.md">main</a> steps to install the components in the IDE.
<ol>
  <li>Drop an instance of TTMSFNCCategoryList on the form</li>  
  <li>Drop an instance of TTMSFNCBitmapContainer on the form</li>
  <li>Add items to the TTMSFNCBitmapContainer instance</li>
  <li>Use the following code to initialize the list
  
  ```delphi
  procedure TForm1.InitializeCategoryList;
  var
    I: Integer;
  begin
    TMSFNCCategoryList1.BitmapContainer := TMSFNCBitmapContainer1;
    TMSFNCCategoryList1.Mode := clmHorizontal;
    for I := 0 to TMSFNCBitmapContainer1.ItemCount - 1 do
      TMSFNCCategoryList1.AddCategoryItem(TMSFNCBitmapContainer1.Items[I].Name);
   end;
  ``` 
<img src="https://www.tmssoftware.com/site/img/github/tmsfnccategorylist.png"/>

<li>
</ol>

### Assigning a popup or embedded control ###
<ol>
  <li>Drop an instance of any visual control you wish to show when clicking on an item on the form</li>
  <li>Assign the visual control to the PopupControl property of the category list item
  
  ```delphi
  procedure TForm1.InitializeCategoryList;
  var
    it: TTMSFNCCategoryListItem;
  begin
    TMSFNCCategoryList1.BitmapContainer := TMSFNCBitmapContainer1;
    TMSFNCCategoryList1.Mode := clmHorizontal;

    it := TMSFNCCategoryList1.AddCategoryItem('Calendar.png');
    it.PopupControl := TMSFNCCalendar1;
    it.PopupMode := ipmPopupControlSize;

    TMSFNCCategoryList1.AddCategoryItem('Recycle Bin.png');
    TMSFNCCategoryList1.AddCategoryItem('Home.png');
    TMSFNCCategoryList1.AddCategoryItem('Print.png');
  end;
  ```

<img src="https://www.tmssoftware.com/site/img/github/tmsfnccategorylist2.png"/>

</li>
<li>Optionally change the popup mode to show an embedded control

  ```delphi
  procedure TForm1.InitializeCategoryList;
  var
    it: TTMSFNCCategoryListItem;
  begin
    TMSFNCCategoryList1.BitmapContainer := TMSFNCBitmapContainer1;
    TMSFNCCategoryList1.Mode := clmHorizontal;

    it := cat.AddCategoryItem('Calendar.png');
    it.PopupControl := TMSFNCCalendar1;
    it.PopupMode := ipmPopupControlSize;

    TMSFNCCategoryList1.AddCategoryItem('Recycle Bin.png');
    TMSFNCCategoryList1.AddCategoryItem('Home.png');
    TMSFNCCategoryList1.AddCategoryItem('Print.png');
    
    TMSFNCCategoryList1.EmbeddedMode := True;    
  end;
  ```

<img src="https://www.tmssoftware.com/site/img/github/tmsfnccategorylist3.png"/>

  
</li>
</ol>
