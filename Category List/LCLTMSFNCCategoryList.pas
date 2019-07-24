{********************************************************************}
{                                                                    }
{ written by TMS Software                                            }
{            copyright © 2017                                        }
{            Email : info@tmssoftware.com                            }
{            Web : http://www.tmssoftware.com                        }
{                                                                    }
{ The source code is given as is. The author is not responsible      }
{ for any possible damage done due to the use of this code.          }
{ The complete source code remains property of the author and may    }
{ not be distributed, published, given or sold in any form as such.  }
{ No parts of the source code can be included in any other component }
{ or application without written authorization of the author.        }
{********************************************************************}

unit LCLTMSFNCCategoryList;

{$I LCLTMSFNCDefines.inc}

{$IFDEF WEBLIB}
{$DEFINE LCLWEBLIB}
{$ENDIF}
{$IFDEF LCLLIB}
{$DEFINE LCLWEBLIB}
{$ENDIF}

interface

uses
  Classes, LCLTMSFNCTypes, LCLTMSFNCGraphics, LCLTMSFNCGraphicsTypes,
  LCLTMSFNCCustomControl, LCLTMSFNCBitmapContainer, LCLTMSFNCPopup, Controls
  {$IFNDEF LCLWEBLIB}
  ,UITypes, Generics.Collections, Types
  {$ENDIF}
  {$IFDEF LCLLIB}
  ,fgl
  {$ENDIF}
  ;

const
  MAJ_VER = 1; // Major version nr.
  MIN_VER = 0; // Minor version nr.
  REL_VER = 0; // Release nr.
  BLD_VER = 0; // Build nr.

type
  TTMSFNCCustomCategoryList = class;

  TTMSFNCCategoryListItemState = (isNormal, isHover, isDown, isSelected, isDisabled);

  TTMSFNCCategoryListItemPopupMode = (ipmPopupControlSize, ipmControlSize, ipmCustom);

  TTMSFNCCategoryListItemPopupOrientation = (ipoUp, ipoDown);

  TTMSFNCCategoryListItem = class(TCollectionItem)
  private
    FOwner: TTMSFNCCustomCategoryList;
    FRowSpan: Integer;
    FColumnSpan: Integer;
    FVisible: Boolean;
    FText: String;
    FEnabled: Boolean;
    FSeparator: Boolean;
    FSeparatorHeight: Single;
    FMargins: TTMSFNCMargins;
    FCanDeselect: Boolean;
    FCanSelect: Boolean;
    FVerticalTextAlign: TTMSFNCGraphicsTextAlign;
    FHorizontalTextAlign: TTMSFNCGraphicsTextAlign;
    FHint: string;
    FBitmaps: TTMSFNCScaledBitmaps;
    FDisabledBitmaps: TTMSFNCScaledBitmaps;
    FPopupHeight: Single;
    FPopupMode: TTMSFNCCategoryListItemPopupMode;
    FPopupWidth: Single;
    FPopupControl: TControl;
    FPopupOrientation: TTMSFNCCategoryListItemPopupOrientation;
    FDataBoolean: Boolean;
    FDataString: String;
    FDataObject: TObject;
    FDataInteger: NativeInt;
    FFocusedControl: TControl;
    FDataPointer: Pointer;
    procedure SetColumnSpan(const Value: Integer);
    procedure SetRowSpan(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
    procedure SetText(const Value: String);
    procedure SetEnabled(const Value: Boolean);
    procedure SetSeparator(const Value: Boolean);
    procedure SetSeparatorHeight(const Value: Single);
    procedure SetMargins(const Value: TTMSFNCMargins);
    procedure SetCanDeselect(const Value: Boolean);
    procedure SetCanSelect(const Value: Boolean);
    procedure SetHorizontalTextAlign(const Value: TTMSFNCGraphicsTextAlign);
    procedure SetVerticalTextAlign(const Value: TTMSFNCGraphicsTextAlign);
    function IsSeparatorHeightStored: Boolean;
    procedure SetBitmaps(const Value: TTMSFNCScaledBitmaps);
    procedure SetDisabledBitmaps(const Value: TTMSFNCScaledBitmaps);
    function GetBitmapContainer: TTMSFNCBitmapContainer;
    function IsPopupHeightStored: Boolean;
    function IsPopupWidthStored: Boolean;
    procedure SetPopupControl(const Value: TControl);
    procedure SetPopupHeight(const Value: Single);
    procedure SetPopupMode(const Value: TTMSFNCCategoryListItemPopupMode);
    procedure SetPopupWidth(const Value: Single);
    procedure SetPopupOrientation(
      const Value: TTMSFNCCategoryListItemPopupOrientation);
    procedure SetFocusedControl(const Value: TControl);
  protected
    procedure BitmapsChanged(Sender: TObject);
    procedure MarginsChanged(Sender: TObject);
    property Text: String read FText write SetText;
    property HorizontalTextAlign: TTMSFNCGraphicsTextAlign read FHorizontalTextAlign write SetHorizontalTextAlign default gtaCenter;
    property VerticalTextAlign: TTMSFNCGraphicsTextAlign read FVerticalTextAlign write SetVerticalTextAlign default gtaCenter;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    function State: TTMSFNCCategoryListItemState;
    destructor Destroy; override;
    property BitmapContainer: TTMSFNCBitmapContainer read GetBitmapContainer;
    property DataPointer: Pointer read FDataPointer write FDataPointer;
    property DataBoolean: Boolean read FDataBoolean write FDataBoolean;
    property DataObject: TObject read FDataObject write FDataObject;
    property DataString: String read FDataString write FDataString;
    property DataInteger: NativeInt read FDataInteger write FDataInteger;
  published
    property FocusedControl: TControl read FFocusedControl write SetFocusedControl;
    property PopupControl: TControl read FPopupControl write SetPopupControl;
    property PopupMode: TTMSFNCCategoryListItemPopupMode read FPopupMode write SetPopupMode default ipmControlSize;
    property PopupOrientation: TTMSFNCCategoryListItemPopupOrientation read FPopupOrientation write SetPopupOrientation default ipoDown;
    property PopupWidth: Single read FPopupWidth write SetPopupWidth stored IsPopupWidthStored nodefault;
    property PopupHeight: Single read FPopupHeight write SetPopupHeight stored IsPopupHeightStored nodefault;
    property Bitmaps: TTMSFNCScaledBitmaps read FBitmaps write SetBitmaps;
    property DisabledBitmaps: TTMSFNCScaledBitmaps read FDisabledBitmaps write SetDisabledBitmaps;
    property CanSelect: Boolean read FCanSelect write SetCanSelect default True;
    property CanDeselect: Boolean read FCanDeselect write SetCanDeselect default False;
    property ColumnSpan: Integer read FColumnSpan write SetColumnSpan default 1;
    property RowSpan: Integer read FRowSpan write SetRowSpan default 1;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Separator: Boolean read FSeparator write SetSeparator default False;
    property SeparatorHeight: Single read FSeparatorHeight write SetSeparatorHeight stored IsSeparatorHeightStored nodefault;
    property Margins: TTMSFNCMargins read FMargins write SetMargins;
    property Hint: string read FHint write FHint;
  end;

  {$IFDEF WEBLIB}
  TTMSFNCCategoryListItems = class(TTMSFNCOwnedCollection)
  {$ELSE}
  TTMSFNCCategoryListItems = class({$IFDEF LCLLIB}specialize {$ENDIF}TTMSFNCOwnedCollection<TTMSFNCCategoryListItem>)
  {$ENDIF}
  private
    FOwner: TTMSFNCCustomCategoryList;
    function GetItem(Index: Integer): TTMSFNCCategoryListItem;
    procedure SetItem(Index: Integer; const Value: TTMSFNCCategoryListItem);
  protected
    function CreateItemClass: TCollectionItemClass; virtual;
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TTMSFNCCustomCategoryList); virtual;
    property Items[Index: Integer]: TTMSFNCCategoryListItem read GetItem write SetItem; default;
    function Add: TTMSFNCCategoryListItem;
    function Insert(Index: Integer): TTMSFNCCategoryListItem;
  end;

  TTMSFNCCategoryListAppearance = class(TPersistent)
  private
    FOwner: TTMSFNCCustomCategoryList;
    FStrokeHover: TTMSFNCGraphicsStroke;
    FFillDown: TTMSFNCGraphicsFill;
    FVerticalSpacing: Single;
    FStrokeDown: TTMSFNCGraphicsStroke;
    FFillSelected: TTMSFNCGraphicsFill;
    FHorizontalSpacing: Single;
    FStrokeSelected: TTMSFNCGraphicsStroke;
    FFill: TTMSFNCGraphicsFill;
    FFillHover: TTMSFNCGraphicsFill;
    FStroke: TTMSFNCGraphicsStroke;
    FFillDisabled: TTMSFNCGraphicsFill;
    FStrokeDisabled: TTMSFNCGraphicsStroke;
    FSeparatorStroke: TTMSFNCGraphicsStroke;
    FFont: TTMSFNCGraphicsFont;
    procedure SetFill(const Value: TTMSFNCGraphicsFill);
    procedure SetFillDown(const Value: TTMSFNCGraphicsFill);
    procedure SetFillHover(const Value: TTMSFNCGraphicsFill);
    procedure SetFillSelected(const Value: TTMSFNCGraphicsFill);
    procedure SetHorizontalSpacing(const Value: Single);
    procedure SetStroke(const Value: TTMSFNCGraphicsStroke);
    procedure SetStrokeDown(const Value: TTMSFNCGraphicsStroke);
    procedure SetStrokeHover(const Value: TTMSFNCGraphicsStroke);
    procedure SetStrokeSelected(const Value: TTMSFNCGraphicsStroke);
    procedure SetVerticalSpacing(const Value: Single);
    procedure SetFillDisabled(const Value: TTMSFNCGraphicsFill);
    procedure SetStrokeDisabled(const Value: TTMSFNCGraphicsStroke);
    procedure SetSeparatorStroke(const Value: TTMSFNCGraphicsStroke);
    procedure SetFont(const Value: TTMSFNCGraphicsFont);
    function IsHorizontalSpacingStored: Boolean;
    function IsVerticalSpacingStored: Boolean;
  protected
    procedure Changed;
    procedure FontChanged(Sender: TObject);
    procedure FillChanged(Sender: TObject);
    procedure StrokeChanged(Sender: TObject);
  public
    constructor Create(AOwner: TTMSFNCCustomCategoryList);
    procedure Assign(Source: TPersistent); override;
    destructor Destroy; override;
  published
    property Stroke: TTMSFNCGraphicsStroke read FStroke write SetStroke;
    property Fill: TTMSFNCGraphicsFill read FFill write SetFill;
    property StrokeHover: TTMSFNCGraphicsStroke read FStrokeHover write SetStrokeHover;
    property FillHover: TTMSFNCGraphicsFill read FFillHover write SetFillHover;
    property StrokeDown: TTMSFNCGraphicsStroke read FStrokeDown write SetStrokeDown;
    property FillDown: TTMSFNCGraphicsFill read FFillDown write SetFillDown;
    property StrokeSelected: TTMSFNCGraphicsStroke read FStrokeSelected write SetStrokeSelected;
    property FillSelected: TTMSFNCGraphicsFill read FFillSelected write SetFillSelected;
    property StrokeDisabled: TTMSFNCGraphicsStroke read FStrokeDisabled write SetStrokeDisabled;
    property FillDisabled: TTMSFNCGraphicsFill read FFillDisabled write SetFillDisabled;
    property VerticalSpacing: Single read FVerticalSpacing write SetVerticalSpacing stored IsVerticalSpacingStored nodefault;
    property HorizontalSpacing: Single read FHorizontalSpacing write SetHorizontalSpacing stored IsHorizontalSpacingStored nodefault;
    property SeparatorStroke: TTMSFNCGraphicsStroke read FSeparatorStroke write SetSeparatorStroke;
    property Font: TTMSFNCGraphicsFont read FFont write SetFont;
  end;

  TTMSFNCCategoryListPositionItem = record
    TileSet: Boolean;
    {$IFDEF LCLLIB}
    class operator = (z1, z2 : TTMSFNCCategoryListPositionItem) b : Boolean;
    {$ENDIF}
  end;

  TTMSFNCCategoryListDisplayItem = record
    Rect: TRectF;
    Item: TTMSFNCCategoryListItem;
    PageIndex: Integer;
    Column, Row, ColumnSpan, RowSpan: Integer;
    {$IFDEF LCLLIB}
    class operator = (z1, z2 : TTMSFNCCategoryListDisplayItem) b : Boolean;
    {$ENDIF}
  end;

  TTMSFNCCategoryListItemPosArray = array of array of TTMSFNCCategoryListPositionItem;

  TTMSFNCCategoryListItemSelected = procedure(Sender: TObject; AItemIndex: Integer) of object;
  TTMSFNCCategoryListItemDeselected = procedure(Sender: TObject; AItemIndex: Integer) of object;
  TTMSFNCCategoryListItemClick = procedure(Sender: TObject; AItemIndex: Integer) of object;
  TTMSFNCCategoryListItemBeforeDrawBackground = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean) of object;
  TTMSFNCCategoryListItemAfterDrawBackground = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer) of object;
  TTMSFNCCategoryListItemBeforeDrawContent = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean) of object;
  TTMSFNCCategoryListItemAfterDrawContent = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer) of object;
  TTMSFNCCategoryListItemBeforeDrawText = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var AText: String; var ADefaultDraw: Boolean) of object;
  TTMSFNCCategoryListItemAfterDrawText = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; AText: String) of object;
  TTMSFNCCategoryListItemBeforeDrawBitmap = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean) of object;
  TTMSFNCCategoryListItemAfterDrawBitmap = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer) of object;
  TTMSFNCCategoryListBeforeDraw = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF; var ADefaultDraw: Boolean) of object;
  TTMSFNCCategoryListAfterDraw = procedure(Sender: TObject; AGraphics: TTMSFNCGraphics; ARect: TRectF) of object;

  {$IFDEF WEBLIB}
  TTMSFNCCategoryListDisplayList = class(TList)
  private
    function GetItem(Index: Integer): TTMSFNCCategoryListDisplayItem;
    procedure SetItem(Index: Integer; const Value: TTMSFNCCategoryListDisplayItem);
  public
    property Items[Index: Integer]: TTMSFNCCategoryListDisplayItem read GetItem write SetItem; default;
  end;
  {$ELSE}
  TTMSFNCCategoryListDisplayList = specialize TFPGList<TTMSFNCCategoryListDisplayItem>;
  {$ENDIF}

  TTMSFNCCategoryListMode = (clmHorizontal, clmVertical);

  TTMSFNCCategoryListEmbeddedItemPosition = (cleTop, cleBottom);

  TTMSFNCCustomCategoryList = class(TTMSFNCCustomControl, ITMSFNCBitmapContainer)
  private
    FPopup: TTMSFNCPopup;
    FBitmapContainer: TTMSFNCBitmapContainer;
    FDisplayList: TTMSFNCCategoryListDisplayList;
    FUpdateCount: Integer;
    FItems: TTMSFNCCategoryListItems;
    FRows: Integer;
    FColumns: Integer;
    FPageCount: Integer;
    FAppearance: TTMSFNCCategoryListAppearance;
    FSelectedItemIndex, FFocusedItemIndex, FHoveredItemIndex, FDownItemIndex: Integer;
    FOnItemBeforeDrawText: TTMSFNCCategoryListItemBeforeDrawText;
    FOnAfterDraw: TTMSFNCCategoryListAfterDraw;
    FOnItemAfterDrawBackground: TTMSFNCCategoryListItemAfterDrawBackground;
    FOnItemSelected: TTMSFNCCategoryListItemSelected;
    FOnItemAfterDrawText: TTMSFNCCategoryListItemAfterDrawText;
    FOnBeforeDraw: TTMSFNCCategoryListBeforeDraw;
    FOnItemBeforeDrawBackground: TTMSFNCCategoryListItemBeforeDrawBackground;
    FOnItemDeselected: TTMSFNCCategoryListItemDeselected;
    FOnItemClick: TTMSFNCCategoryListItemClick;
    FOnItemBeforeDrawContent: TTMSFNCCategoryListItemBeforeDrawContent;
    FOnItemAfterDrawContent: TTMSFNCCategoryListItemAfterDrawContent;
    FBlockChange: Boolean;
    FMode: TTMSFNCCategoryListMode;
    FOnItemAfterDrawBitmap: TTMSFNCCategoryListItemAfterDrawBitmap;
    FOnItemBeforeDrawBitmap: TTMSFNCCategoryListItemBeforeDrawBitmap;
    FEmbeddedSize: Single;
    FEmbeddedItemPosition: TTMSFNCCategoryListEmbeddedItemPosition;
    FEmbeddedMode: Boolean;
    procedure SetItems(const Value: TTMSFNCCategoryListItems);
    procedure SetColumns(const Value: Integer);
    procedure SetRows(const Value: Integer);
    procedure SetAppearance(const Value: TTMSFNCCategoryListAppearance);
    procedure SetSelectedItemIndex(const Value: Integer);
    procedure SetMode(const Value: TTMSFNCCategoryListMode);
    function GetBitmapContainer: TTMSFNCBitmapContainer;
    procedure SetBitmapContainer(const Value: TTMSFNCBitmapContainer);
    function IsEmbeddedSizeStored: Boolean;
    procedure SetEmbeddedSize(const Value: Single);
    procedure SetEmbeddedItemPosition(
      const Value: TTMSFNCCategoryListEmbeddedItemPosition);
    procedure SetEmbeddedMode(const Value: Boolean);
  protected
    function GetHintString: string; override;
    function HasHint: Boolean; override;
    function GetVersion: String; override;
    function GetDisplayItem(AItemIndex: Integer): TTMSFNCCategoryListDisplayItem;
    function GetNextSelectableItem: Integer;
    function GetPreviousSelectableItem: Integer;
    function GetNextSelectableRowItem: Integer;
    function GetPreviousSelectableRowItem: Integer;
    function GetFirstSelectableItem: Integer;
    function GetLastSelectableItem: Integer;
    function CreateItemsCollection: TTMSFNCCategoryListItems; virtual;
    function GetTotalSeparatorHeight: Single;
    function GetTotalSeparatorCount: Integer;
    function GetColumns: Integer;
    function GetRows: Integer;
    procedure HandleEmbeddedControl(AItem: TTMSFNCCategoryListDisplayItem);
    procedure UpdateActivePopup;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CalculateItems; virtual;
    procedure ApplyStyle; override;
    procedure ResetToDefaultStyle; override;
    procedure InvalidateItems;
    procedure HandlePopup(AItem: TTMSFNCCategoryListDisplayItem);
    procedure DoItemSelected(AItemIndex: Integer); virtual;
    procedure DoItemClick(AItemIndex: Integer); virtual;
    procedure DoItemDeselected(AItemIndex: Integer); virtual;
    procedure DoItemBeforeDrawBackground(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean); virtual;
    procedure DoItemAfterDrawBackground(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer); virtual;
    procedure DoItemBeforeDrawContent(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean); virtual;
    procedure DoItemAfterDrawContent(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer); virtual;
    procedure DoItemBeforeDrawText(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var AText: String; var ADefaultDraw: Boolean); virtual;
    procedure DoItemAfterDrawText(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; AText: String); virtual;
    procedure DoItemBeforeDrawBitmap(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean); virtual;
    procedure DoItemAfterDrawBitmap(AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer); virtual;
    procedure DoBeforeDraw(AGraphics: TTMSFNCGraphics; ARect: TRectF; var ADefaultDraw: Boolean); reintroduce; virtual;
    procedure DoAfterDraw(AGraphics: TTMSFNCGraphics; ARect: TRectF); reintroduce; virtual;
    procedure DrawItems(AGraphics: TTMSFNCGraphics); virtual;
    procedure Draw(AGraphics: TTMSFNCGraphics; ARect: TRectF); override;

    procedure DrawItem(AGraphics: TTMSFNCGraphics; ADisplayItem: TTMSFNCCategoryListDisplayItem); virtual;
    procedure DrawItemBackGround(AGraphics: TTMSFNCGraphics; ADisplayItem: TTMSFNCCategoryListDisplayItem); virtual;
    procedure DrawItemContent(AGraphics: TTMSFNCGraphics; ADisplayItem: TTMSFNCCategoryListDisplayItem); virtual;
    procedure DrawItemText(AGraphics: TTMSFNCGraphics; ADisplayItem: TTMSFNCCategoryListDisplayItem); virtual;
    procedure DrawItemBitmap(AGraphics: TTMSFNCGraphics; ADisplayItem: TTMSFNCCategoryListDisplayItem); virtual;

    procedure HandleMouseDown(Button: TTMSFNCMouseButton; Shift: TShiftState; X: Single; Y: Single); override;
    procedure HandleMouseUp(Button: TTMSFNCMouseButton; Shift: TShiftState; X: Single; Y: Single); override;
    procedure HandleMouseMove(Shift: TShiftState; X: Single; Y: Single); override;
    procedure HandleKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure HandleKeyUp(var Key: Word; Shift: TShiftState); override;
    procedure HandleMouseLeave; override;
    procedure ProcessSelection(AItemIndex: Integer);
    property SelectedItemIndex: Integer read FSelectedItemIndex write SetSelectedItemIndex default -1;
    property Rows: Integer read FRows write SetRows default -1;
    property Columns: Integer read FColumns write SetColumns default -1;
    property Version: String read GetVersion;
    property Items: TTMSFNCCategoryListItems read FItems write SetItems;
    property Appearance: TTMSFNCCategoryListAppearance read FAppearance write SetAppearance;
    property OnItemSelected: TTMSFNCCategoryListItemSelected read FOnItemSelected write FOnItemSelected;
    property OnItemDeselected: TTMSFNCCategoryListItemDeselected read FOnItemDeselected write FOnItemDeselected;
    property OnItemClick: TTMSFNCCategoryListItemClick read FOnItemClick write FOnItemClick;
    property OnItemBeforeDrawBackground: TTMSFNCCategoryListItemBeforeDrawBackground read FOnItemBeforeDrawBackground write FOnItemBeforeDrawBackground;
    property OnItemAfterDrawBackground: TTMSFNCCategoryListItemAfterDrawBackground read FOnItemAfterDrawBackground write FOnItemAfterDrawBackground;
    property OnItemBeforeDrawContent: TTMSFNCCategoryListItemBeforeDrawContent read FOnItemBeforeDrawContent write FOnItemBeforeDrawContent;
    property OnItemAfterDrawContent: TTMSFNCCategoryListItemAfterDrawContent read FOnItemAfterDrawContent write FOnItemAfterDrawContent;
    property OnBeforeDraw: TTMSFNCCategoryListBeforeDraw read FOnBeforeDraw write FOnBeforeDraw;
    property OnAfterDraw: TTMSFNCCategoryListAfterDraw read FOnAfterDraw write FOnAfterDraw;
    property OnItemBeforeDrawText: TTMSFNCCategoryListItemBeforeDrawText read FOnItemBeforeDrawText write FOnItemBeforeDrawText;
    property OnItemAfterDrawText: TTMSFNCCategoryListItemAfterDrawText read FOnItemAfterDrawText write FOnItemAfterDrawText;
    property OnItemBeforeDrawBitmap: TTMSFNCCategoryListItemBeforeDrawBitmap read FOnItemBeforeDrawBitmap write FOnItemBeforeDrawBitmap;
    property OnItemAfterDrawBitmap: TTMSFNCCategoryListItemAfterDrawBitmap read FOnItemAfterDrawBitmap write FOnItemAfterDrawBitmap;
    property Mode: TTMSFNCCategoryListMode read FMode write SetMode default clmVertical;
    property EmbeddedMode: Boolean read FEmbeddedMode write SetEmbeddedMode default False;
    property EmbeddedSize: Single read FEmbeddedSize write SetEmbeddedSize stored IsEmbeddedSizeStored nodefault;
    property EmbeddedItemPosition: TTMSFNCCategoryListEmbeddedItemPosition read FEmbeddedItemPosition write SetEmbeddedItemPosition default cleTop;
    property BitmapContainer: TTMSFNCBitmapContainer read GetBitmapContainer write SetBitmapContainer;
    property Popup: TTMSFNCPopup read FPopup;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    property BlockChange: Boolean read FBlockChange write FBlockChange;
    procedure UpdateControlAfterResize; override;
    procedure InitializeDefault; virtual;
    function XYToItem(X, Y: Single): Integer;
    function InsertCategoryItem(AIndex: Integer; ABitmap: TTMSFNCBitmap): TTMSFNCCategoryListItem; overload; virtual;
    function AddCategoryItem(ABitmap: TTMSFNCBitmap): TTMSFNCCategoryListItem; overload; virtual;
    function InsertCategoryItem(AIndex: Integer; ABitmapName: string): TTMSFNCCategoryListItem; overload; virtual;
    function AddCategoryItem(ABitmapName: string): TTMSFNCCategoryListItem; overload; virtual;
    function InsertCategoryItem(AIndex: Integer): TTMSFNCCategoryListItem; overload; virtual;
    function AddCategoryItem: TTMSFNCCategoryListItem; overload; virtual;
  end;

  TTMSFNCCategoryList = class(TTMSFNCCustomCategoryList)
  protected
    procedure RegisterRuntimeClasses; override;
  public
    property Popup;
  published
    property Appearance;
    property BitmapContainer;
    property Items;
    property EmbeddedMode;
    property EmbeddedSize;
    property EmbeddedItemPosition;
    property Mode;
    property Fill;
    property Stroke;
    property Version;
    property OnItemClick;
    property OnItemSelected;
    property SelectedItemIndex;
    property OnItemBeforeDrawBackground;
    property OnItemAfterDrawBackground;
    property OnItemBeforeDrawContent;
    property OnItemAfterDrawContent;
    property OnBeforeDraw;
    property OnAfterDraw;
    property OnItemBeforeDrawBitmap;
    property OnItemAfterDrawBitmap;
  end;

implementation

uses
  Math, LCLTMSFNCUtils, LCLTMSFNCStyles
  {$IFDEF FMXLIB}
  , FMX.Types
  {$ENDIF}
  ;

{ TTMSFNCCustomCategoryList }

function TTMSFNCCustomCategoryList.AddCategoryItem: TTMSFNCCategoryListItem;
begin
  Result := Items.Add;
end;

function TTMSFNCCustomCategoryList.AddCategoryItem(
  ABitmapName: string): TTMSFNCCategoryListItem;
begin
  Result := Items.Add;
  Result.Bitmaps.AddBitmapName(ABitmapName);
end;

function TTMSFNCCustomCategoryList.AddCategoryItem(
  ABitmap: TTMSFNCBitmap): TTMSFNCCategoryListItem;
begin
  Result := Items.Add;
  Result.Bitmaps.AddBitmap(ABitmap)
end;

procedure TTMSFNCCustomCategoryList.ApplyStyle;
var
  c: TTMSFNCGraphicsColor;
begin
  inherited;

  c := gcNull;
  if TTMSFNCStyles.GetStyleBackgroundFillColor(c) then
    Fill.Color := c;

  c := gcNull;
  if TTMSFNCStyles.GetStyleBackgroundStrokeColor(c) then
    Stroke.Color := c;

  c := gcNull;
  if TTMSFNCStyles.GetStyleDefaultButtonFillColor(c) then
    Appearance.Fill.Color := c;

  c := gcNull;
  if TTMSFNCStyles.GetStyleSelectionFillColor(c) then
  begin
    Appearance.FillSelected.Color := c;
    Appearance.FillDown.Color := c;
    Appearance.FillHover.Color := Blend(c, Appearance.Fill.Color, 25);
  end;

  c := gcNull;
  if TTMSFNCStyles.GetStyleDefaultButtonStrokeColor(c) then
  begin
    Appearance.Stroke.Color := c;
    Appearance.StrokeSelected.Color := c;
    Appearance.StrokeDown.Color := c;
    Appearance.StrokeHover.Color := c;
  end;

  c := gcNull;
  if TTMSFNCStyles.GetStyleTextFontColor(c) then
    Appearance.Font.Color := c;
end;

procedure TTMSFNCCustomCategoryList.Assign(Source: TPersistent);
begin
  inherited;
  if Source is TTMSFNCCategoryList then
  begin
    FItems.Assign((Source as TTMSFNCCategoryList).Items);
    FAppearance.Assign((Source as TTMSFNCCategoryList).Appearance);
    FRows := (Source as TTMSFNCCategoryList).Rows;
    FColumns := (Source as TTMSFNCCategoryList).Columns;
    FMode := (Source as TTMSFNCCategoryList).Mode;
  end;
end;

procedure TTMSFNCCustomCategoryList.BeginUpdate;
begin
  inherited;
  Inc(FUpdateCount);
end;

procedure TTMSFNCCustomCategoryList.CalculateItems;
var
  itposarr: TTMSFNCCategoryListItemPosArray;
  r, newr, c, newc: Integer;
  AItemIndex: Integer;
  AItem: TTMSFNCCategoryListItem;
  cspan, rspan, newcspan, newrspan: Integer;
  I: Integer;
  K: Integer;
  sepc: Integer;
  f: Boolean;
  APageIndex: Integer;
  hs, vs: Single;
  iw, ih: Single;
  w, h: Single;
  exw, exh: Single;
  tx, ty: Single;
  pw, ph: Single;
  offs: Single;
  itd: TTMSFNCCategoryListDisplayItem;

  procedure FindNewPos(AItem: TTMSFNCCategoryListItem; var ANewR: Integer; var ANewC: Integer; var AFound: Boolean; ARows , {%H-}ACurRow, AColumns, {%H-}ACurCol: Integer; PosArr: TTMSFNCCategoryListItemPosArray);
  var
    i, k: integer;
    cspan, rspan: Integer;
    J, L: Integer;
  begin
    AFound := False;
    for I := ANewr to ARows - 1 do
    begin
      for K := ANewC to AColumns - 1 do
      begin
        cspan := AItem.ColumnSpan;
        cspan := Min(cspan, AColumns - ANewC);
        rspan := AItem.RowSpan;
        rspan := Min(rspan, ARows - ANewR);

        AFound := true;
        for J := 0 to rspan - 1 do
        begin
          for L := 0 to cspan - 1 do
          begin
            if PosArr[I + J, K + L].TileSet then
              AFound := False;
          end;
        end;

        if AFound then
          Break;
        Inc(ANewC);
      end;
      if AFound then
        Break;

      ANewC := 0;
      Inc(ANewr);
    end;
  end;
begin
  if (csDestroying in ComponentState) or (FUpdateCount > 0) then
    Exit;

  FDisplayList.Clear;

  if Items.Count = 0 then
    Exit;

  pw := Width;
  ph := Height;

  if EmbeddedMode then
  begin
    case Mode of
      clmHorizontal: ph := ph - EmbeddedSize;
      clmVertical: pw := pw - EmbeddedSize;
    end;
  end;

  hs := Appearance.HorizontalSpacing;
  vs := Appearance.VerticalSpacing;
  w := pw - vs;
  iw := w;
  if GetColumns > 0 then
    iw := (w - (GetColumns * hs)) / GetColumns;

  h := ph - vs - GetTotalSeparatorHeight;
  sepc := GetTotalSeparatorCount;
  ih := h;
  if (GetRows - sepc) > 0 then
    ih := (h - ((GetRows - sepc) * vs)) / (GetRows - sepc);

  AItemIndex := 0;
  APageIndex := 0;
  offs := 0;
  while AItemIndex <= Items.Count - 1 do
  begin
    c := 0;
    r := 0;
    SetLength(itposarr, 0, 0);
    SetLength(itposarr, GetRows, GetColumns);

    while r < GetRows do
    begin
      while (c < GetColumns) do
      begin
        if (AItemIndex >= 0) and (AItemIndex <= Items.Count - 1) and (APageIndex = 0) then
        begin
          AItem := Items[AItemIndex];
          if not AItem.Visible then
          begin
            Inc(AItemIndex);
            Continue;
          end;

          if AItem.Separator then
          begin
            cspan := GetColumns;
            rspan := 1;
          end
          else
          begin
            cspan := AItem.ColumnSpan;
            rspan := AItem.RowSpan;
          end;

          cspan := Min(cspan, GetColumns - c);
          rspan := Min(rspan, GetRows - r);

          exw := iw * cspan + (hs * (cspan - 1));
          if AItem.Separator then
            exh := AItem.SeparatorHeight
          else
            exh := ih * rspan + (vs * (rspan - 1));

          tx := (pw * APageIndex) + hs + iw * c + (hs * c);
          ty := offs + vs + ih * r + (vs * r);

          if EmbeddedMode then
          begin
            case Mode of
              clmHorizontal:
              begin
                case EmbeddedItemPosition of
                  cleBottom: ty := ty + Height - exh;
                end;
              end;
              clmVertical:
              begin
                case EmbeddedItemPosition of
                  cleBottom: tx := tx + Width - exw;
                end;
              end;
            end;
          end;

          itd.Rect := RectF(tx + AItem.Margins.Left, ty + AItem.Margins.Top,
            tx + exw - AItem.Margins.Right, ty + exh - AItem.Margins.Bottom);

          itd.Item := AItem;
          itd.PageIndex := APageIndex;
          itd.Column := c;
          itd.Row := r;
          itd.ColumnSpan := cspan;
          itd.RowSpan := rspan;
          FDisplayList.Add(itd);

          newcspan := c;
          newrspan := r;
          newcspan := newcspan + cspan - 1;
          newrspan := newrspan + rspan - 1;

          for I := r to newrspan do
            for K := c to newcspan do
              itposarr[I, K].TileSet := True;

          if AItem.Separator then
            offs := offs + AItem.SeparatorHeight - ih * rspan + (vs * (rspan - 1));
        end;
        Inc(AItemIndex);
        Inc(c);
        newc := c;
        newr := r;
        f := False;
        if (AItemIndex >= 0) and (AItemIndex <= Items.Count - 1) then
          FindNewPos(Items[AItemIndex], newr, newc, f, GetRows, newr, GetColumns, newc, itposarr);
        c := newc;
        r := newr;

        if (c >= GetColumns) or (r >= GetRows) then
          Break;
      end;
      c := 0;
      Inc(r);
      newc := c;
      newr := r;
      f := False;
      if (AItemIndex >= 0) and (AItemIndex <= Items.Count - 1) then
        FindNewPos(Items[AItemIndex], newr, newc, f, GetRows, newr, GetColumns, newc, itposarr);
      c := newc;
      r := newr;
      if r >= GetRows then
        Break;
    end;
    Inc(APageIndex);
  end;

  FPageCount := APageIndex;
  InvalidateItems;
  HandleEmbeddedControl(GetDisplayItem(SelectedItemIndex));
end;

constructor TTMSFNCCustomCategoryList.Create(AOwner: TComponent);
begin
  inherited;
  FColumns := -1;
  FRows := -1;
  FItems := CreateItemsCollection;
  FDisplayList := TTMSFNCCategoryListDisplayList.Create;
  FAppearance := TTMSFNCCategoryListAppearance.Create(Self);
  FSelectedItemIndex := -1;
  FFocusedItemIndex := -1;
  FHoveredItemIndex := -1;
  FDownItemIndex := -1;
  FMode := clmVertical;
  FEmbeddedSize := 350;
  FEmbeddedItemPosition := cleTop;
  FEmbeddedMode := False;

  FPopup := TTMSFNCPopup.Create(Self);
  FPopup.Placement := ppAbsolute;
  FPopup.PlacementControl := Self;
  FPopup.DragWithParent := True;

  Width := 50;
  Height := 400;

  if IsDesignTime then
    InitializeDefault;
end;

procedure TTMSFNCCustomCategoryList.InitializeDefault;
begin

end;

function TTMSFNCCustomCategoryList.InsertCategoryItem(AIndex: Integer): TTMSFNCCategoryListItem;
begin
  Result := Items.Insert(AIndex);
end;

function TTMSFNCCustomCategoryList.IsEmbeddedSizeStored: Boolean;
begin
  Result := EmbeddedSize <> 350;
end;

procedure TTMSFNCCustomCategoryList.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: Integer;
begin
  inherited;
  if not (csDestroying in ComponentState) and (Operation = opRemove) and (AComponent = FBitmapContainer) then
    FBitmapContainer := nil;

  if not (csDestroying in ComponentState) and (Operation = opRemove) then
  begin
    for i := 0 to Items.Count - 1 do
    begin
      if AComponent = Items[i].FPopupControl then
        Items[i].FPopupControl := nil;

      if AComponent = Items[i].FFocusedControl then
        Items[i].FFocusedControl := nil;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.InsertCategoryItem(AIndex: integer;
  ABitmapName: string): TTMSFNCCategoryListItem;
begin
  Result := Items.Insert(AIndex);
  Result.Bitmaps.AddBitmapName(ABitmapName);
end;

function TTMSFNCCustomCategoryList.InsertCategoryItem(AIndex: integer;
  ABitmap: TTMSFNCBitmap): TTMSFNCCategoryListItem;
begin
  Result := Items.Insert(AIndex);
  Result.Bitmaps.AddBitmap(ABitmap)
end;

function TTMSFNCCustomCategoryList.CreateItemsCollection: TTMSFNCCategoryListItems;
begin
  Result := TTMSFNCCategoryListItems.Create(Self);
end;

destructor TTMSFNCCustomCategoryList.Destroy;
begin
  FPopup.Free;
  FAppearance.Free;
  FDisplayList.Free;
  FItems.Free;
  inherited;
end;

procedure TTMSFNCCustomCategoryList.DoAfterDraw(AGraphics: TTMSFNCGraphics; ARect: TRectF);
begin
  if Assigned(OnAfterDraw) then
    OnAfterDraw(Self, AGraphics, ARect);
end;

procedure TTMSFNCCustomCategoryList.DoBeforeDraw(AGraphics: TTMSFNCGraphics; ARect: TRectF;
  var ADefaultDraw: Boolean);
begin
  if Assigned(OnBeforeDraw) then
    OnBeforeDraw(Self, AGraphics, ARect, ADefaultDraw);
end;

procedure TTMSFNCCustomCategoryList.DoItemAfterDrawBackground(AGraphics: TTMSFNCGraphics;
  ARect: TRectF; AItemIndex: Integer);
begin
  if Assigned(OnItemAfterDrawBackground) then
    OnItemAfterDrawBackground(Self, AGraphics, ARect, AItemIndex);
end;

procedure TTMSFNCCustomCategoryList.DoItemAfterDrawBitmap(
  AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer);
begin
  if Assigned(OnItemAfterDrawBitmap) then
    OnItemAfterDrawBitmap(Self, AGraphics, ARect, AItemIndex);
end;

procedure TTMSFNCCustomCategoryList.DoItemAfterDrawContent(AGraphics: TTMSFNCGraphics;
  ARect: TRectF; AItemIndex: Integer);
begin
  if Assigned(OnItemAfterDrawContent) then
    OnItemAfterDrawContent(Self, AGraphics, ARect, AItemIndex);
end;

procedure TTMSFNCCustomCategoryList.DoItemAfterDrawText(AGraphics: TTMSFNCGraphics;
  ARect: TRectF; AItemIndex: Integer; AText: String);
begin
  if Assigned(OnItemAfterDrawText) then
    OnItemAfterDrawText(Self, AGraphics, ARect, AItemIndex, AText);
end;

procedure TTMSFNCCustomCategoryList.DoItemBeforeDrawBackground(AGraphics: TTMSFNCGraphics;
  ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean);
begin
  if Assigned(OnItemBeforeDrawBackground) then
    OnItemBeforeDrawBackground(Self, AGraphics, ARect, AItemIndex, ADefaultDraw);
end;

procedure TTMSFNCCustomCategoryList.DoItemBeforeDrawBitmap(
  AGraphics: TTMSFNCGraphics; ARect: TRectF; AItemIndex: Integer;
  var ADefaultDraw: Boolean);
begin
  if Assigned(OnItemBeforeDrawBitmap) then
    OnItemBeforeDrawBitmap(Self, AGraphics, ARect, AItemIndex, ADefaultDraw);
end;

procedure TTMSFNCCustomCategoryList.DoItemBeforeDrawContent(AGraphics: TTMSFNCGraphics;
  ARect: TRectF; AItemIndex: Integer; var ADefaultDraw: Boolean);
begin
  if Assigned(OnItemBeforeDrawContent) then
    OnItemBeforeDrawContent(Self, AGraphics, ARect, AItemIndex, ADefaultDraw);
end;

procedure TTMSFNCCustomCategoryList.DoItemBeforeDrawText(AGraphics: TTMSFNCGraphics;
  ARect: TRectF; AItemIndex: Integer; var AText: String;
  var ADefaultDraw: Boolean);
begin
  if Assigned(OnItemBeforeDrawText) then
    OnItemBeforeDrawText(Self, AGraphics, ARect, AItemIndex, AText, ADefaultDraw);
end;

procedure TTMSFNCCustomCategoryList.DoItemSelected(AItemIndex: Integer);
begin
  if Assigned(OnItemSelected) then
    OnItemSelected(Self, AItemIndex);
end;

procedure TTMSFNCCustomCategoryList.DoItemClick(AItemIndex: Integer);
begin
  if Assigned(OnItemClick) then
    OnItemClick(Self, AItemIndex);
end;

procedure TTMSFNCCustomCategoryList.DoItemDeselected(AItemIndex: Integer);
begin
  if Assigned(OnItemDeselected) then
    OnItemDeselected(Self, AItemIndex);
end;

procedure TTMSFNCCustomCategoryList.HandleMouseLeave;
begin
  inherited;
  FHoveredItemIndex := -1;
  InvalidateItems;
end;

procedure TTMSFNCCustomCategoryList.DrawItem(AGraphics: TTMSFNCGraphics;
  ADisplayItem: TTMSFNCCategoryListDisplayItem);
begin
  DrawItemBackGround(AGraphics, ADisplayItem);
  DrawItemContent(AGraphics, ADisplayItem);
  DrawItemBitmap(AGraphics, ADisplayItem);
  DrawItemText(AGraphics, ADisplayItem);
end;

procedure TTMSFNCCustomCategoryList.DrawItemBackGround(AGraphics: TTMSFNCGraphics; ADisplayItem: TTMSFNCCategoryListDisplayItem);
var
  r: TRectF;
  it: TTMSFNCCategoryListItem;
  a: Boolean;
  fr: TRectF;
begin
  it := ADisplayItem.Item;
  if Assigned(it) then
  begin
    if not it.Separator then
    begin
      AGraphics.Fill.Assign(Appearance.Fill);
      AGraphics.Stroke.Assign(Appearance.Stroke);
      if it.Enabled then
      begin
        if it.Index = FDownItemIndex then
        begin
          AGraphics.Fill.Assign(Appearance.FillDown);
          AGraphics.Stroke.Assign(Appearance.StrokeDown);
        end
        else if it.Index = FHoveredItemIndex then
        begin
          AGraphics.Fill.Assign(Appearance.FillHover);
          AGraphics.Stroke.Assign(Appearance.StrokeHover);
        end
        else if it.Index = FSelectedItemIndex then
        begin
          AGraphics.Fill.Assign(Appearance.FillSelected);
          AGraphics.Stroke.Assign(Appearance.StrokeSelected);
        end;
      end
      else
      begin
        AGraphics.Fill.Assign(Appearance.FillDisabled);
        AGraphics.Stroke.Assign(Appearance.StrokeDisabled);
      end;
    end
    else
      AGraphics.Stroke.Assign(Appearance.SeparatorStroke);

    r := ADisplayItem.Rect;
    a := True;
    DoItemBeforeDrawBackground(AGraphics, ADisplayItem.Rect, it.Index, a);
    if a then
    begin
      if it.Separator then
        AGraphics.DrawLine(PointF(r.Left, CenterPointEx(r).Y), PointF(r.Right, CenterPointEx(r).Y))
      else
      begin
        AGraphics.DrawRectangle(r);
        if Focused and (FFocusedItemIndex = it.Index) then
        begin
          fr := r;
          InflateRectEx(fr, -2, -2);
          AGraphics.DrawFocusRectangle(fr);
        end;
      end;

      DoItemAfterDrawBackground(AGraphics, ADisplayItem.Rect, it.Index);
    end;
  end;
end;

procedure TTMSFNCCustomCategoryList.DrawItemBitmap(AGraphics: TTMSFNCGraphics;
  ADisplayItem: TTMSFNCCategoryListDisplayItem);
var
  r: TRectF;
  it: TTMSFNCCategoryListItem;
  a: Boolean;
begin
  it := ADisplayItem.Item;
  if Assigned(it) then
  begin
    r := ADisplayItem.Rect;
    a := True;
    DoItemBeforeDrawBitmap(AGraphics, ADisplayItem.Rect, it.Index, a);
    if a then
    begin
      InflateRectEx(r, -2, -2);
      if it.Enabled then
        AGraphics.DrawScaledBitmap(r, it.Bitmaps)
      else
        AGraphics.DrawScaledBitmap(r, it.DisabledBitmaps);

      DoItemAfterDrawBitmap(AGraphics, ADisplayItem.Rect, it.Index);
    end;
  end;
end;

procedure TTMSFNCCustomCategoryList.DrawItemContent(AGraphics: TTMSFNCGraphics;
  ADisplayItem: TTMSFNCCategoryListDisplayItem);
var
  it: TTMSFNCCategoryListItem;
  a: Boolean;
begin
  it := ADisplayItem.Item;
  if Assigned(it) then
  begin
    a := True;
    DoItemBeforeDrawContent(AGraphics, ADisplayItem.Rect, it.Index, a);
    if a then
      DoItemAfterDrawContent(AGraphics, ADisplayItem.Rect, it.Index);
  end;
end;

procedure TTMSFNCCustomCategoryList.DrawItems(AGraphics: TTMSFNCGraphics);
var
  I: Integer;
begin
  for I := 0 to FDisplayList.Count - 1 do
    DrawItem(AGraphics, TTMSFNCCategoryListDisplayItem(FDisplayList[I]));
end;

procedure TTMSFNCCustomCategoryList.DrawItemText(AGraphics: TTMSFNCGraphics;
  ADisplayItem: TTMSFNCCategoryListDisplayItem);
var
  r: TRectF;
  it: TTMSFNCCategoryListItem;
  str: String;
  a: Boolean;
begin
  it := ADisplayItem.Item;
  if Assigned(it) and (it.Text <> '') then
  begin
    r := ADisplayItem.Rect;
    str := it.Text;
    a := True;
    InflateRectEx(r, -2, -2);
    AGraphics.Font.Assign(Appearance.Font);
    DoItemBeforeDrawText(AGraphics, ADisplayItem.Rect, it.Index, str, a);
    if a then
    begin
      AGraphics.DrawText(r, str, False, it.HorizontalTextAlign, it.VerticalTextAlign);
      DoItemAfterDrawText(AGraphics, ADisplayItem.Rect, it.Index, str);
    end;
  end;
end;

procedure TTMSFNCCustomCategoryList.EndUpdate;
begin
  inherited;
  Dec(FUpdateCount);
  if FUpdateCount = 0 then
    CalculateItems;
end;

function TTMSFNCCustomCategoryList.GetFirstSelectableItem: Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
begin
  Result := FFocusedItemIndex;
  for I := 0 to FDisplayList.Count - 1 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and it.Enabled and not it.Separator and it.CanSelect then
    begin
      Result := it.Index;
      Break;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.GetHintString: string;
var
  it: TTMSFNCCategoryListItem;
begin
  Result := inherited;
  if (FHoveredItemIndex >= 0) and (FHoveredItemIndex <= FItems.Count - 1) then
  begin
    it := FItems[FHoveredItemIndex];
    Result := it.Hint;
  end;
end;

function TTMSFNCCustomCategoryList.GetLastSelectableItem: Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
begin
  Result := FFocusedItemIndex;
  for I := FDisplayList.Count - 1 downto 0 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and it.Enabled and not it.Separator and it.CanSelect then
    begin
      Result := it.Index;
      Break;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.GetNextSelectableItem: Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
begin
  Result := FFocusedItemIndex;
  for I := 0 to FDisplayList.Count - 1 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and it.Enabled and it.CanSelect and not it.Separator and (it.Index > FFocusedItemIndex) then
    begin
      Result := it.Index;
      Break;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.GetNextSelectableRowItem: Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
  disp: TTMSFNCCategoryListDisplayItem;
begin
  Result := FFocusedItemIndex;
  if Result = -1 then
  begin
    Result := GetNextSelectableItem;
    Exit;
  end;

  disp := GetDisplayItem(FFocusedItemIndex);
  for I := 0 to FDisplayList.Count - 1 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and it.Enabled and it.CanSelect and not it.Separator and (it.Index > FFocusedItemIndex) and (disp.Column >= FDisplayList[I].Column) and
      (disp.Column <= FDisplayList[I].Column + (FDisplayList[I].ColumnSpan - 1))
      and (FDisplayList[I].Row > disp.Row) then
    begin
      Result := it.Index;
      Break;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.GetPreviousSelectableItem: Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
begin
  Result := FFocusedItemIndex;
  for I := FDisplayList.Count - 1 downto 0 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and it.Enabled and it.CanSelect and not it.Separator and (it.Index < FFocusedItemIndex) then
    begin
      Result := it.Index;
      Break;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.GetPreviousSelectableRowItem: Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
  disp: TTMSFNCCategoryListDisplayItem;
begin
  Result := FFocusedItemIndex;
  if Result = -1 then
  begin
    Result := GetPreviousSelectableItem;
    Exit;
  end;

  disp := GetDisplayItem(FFocusedItemIndex);
  for I := FDisplayList.Count - 1 downto 0 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and it.Enabled and it.CanSelect and not (it.Separator) and (it.Index < FFocusedItemIndex) and (disp.Column >= FDisplayList[I].Column) and
      (disp.Column <= FDisplayList[I].Column + (FDisplayList[I].ColumnSpan - 1)) and (FDisplayList[I].Row < disp.Row) then
    begin
      Result := it.Index;
      Break;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.GetRows: Integer;
begin
  case Mode of
    clmHorizontal: Result := 1;
    clmVertical:
    begin
      if Rows = -1 then
        Result := Items.Count
      else
        Result := Rows;
    end;
    else
      Result := 0;
  end;
end;

function TTMSFNCCustomCategoryList.GetTotalSeparatorCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Items.Count - 1 do
  begin
    if Items[I].Separator then
      Inc(Result);
  end;
end;

function TTMSFNCCustomCategoryList.GetTotalSeparatorHeight: Single;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Items.Count - 1 do
  begin
    if Items[I].Separator then
      Result := Result + Items[I].SeparatorHeight + Appearance.VerticalSpacing;
  end;
end;

function TTMSFNCCustomCategoryList.GetVersion: String;
begin
  Result := GetVersionNumber(MAJ_VER, MIN_VER, REL_VER, BLD_VER);
end;

procedure TTMSFNCCustomCategoryList.HandleKeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key in [KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT, KEY_HOME, KEY_END] then
  begin
    case Key of
      KEY_UP: FFocusedItemIndex := GetPreviousSelectableRowItem;
      KEY_LEFT: FFocusedItemIndex := GetPreviousSelectableItem;
      KEY_DOWN: FFocusedItemIndex := GetNextSelectableRowItem;
      KEY_RIGHT: FFocusedItemIndex := GetNextSelectableItem;
      KEY_HOME: FFocusedItemIndex := GetFirstSelectableItem;
      KEY_END: FFocusedItemIndex := GetLastSelectableItem;
    end;
    InvalidateItems;
  end;

  if (Key = KEY_RETURN) then
  begin
    FDownItemIndex := FFocusedItemIndex;
    InvalidateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.HandleKeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = KEY_RETURN) then
  begin
    FDownItemIndex := -1;
    ProcessSelection(FFocusedItemIndex);
    InvalidateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.HandleMouseDown(Button: TTMSFNCMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  inherited;
  CaptureEx;
  FDownItemIndex := XYToItem(X, Y);
  InvalidateItems;
end;

procedure TTMSFNCCustomCategoryList.HandleMouseMove(Shift: TShiftState; X, Y: Single);
var
  h: Integer;
begin
  inherited;
  if FDownItemIndex > -1 then
    Exit;

  h := XYToItem(X, Y);
  if h <> FHoveredItemIndex then
  begin
    FHoveredItemIndex := h;
    CancelHint;
    InvalidateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.HandleMouseUp(Button: TTMSFNCMouseButton; Shift: TShiftState;
  X, Y: Single);
var
  s: Integer;
begin
  inherited;
  ReleaseCaptureEx;
  s := XYToItem(X, Y);
  if (s = FDownItemIndex) and (FDownItemIndex <> -1) then
  begin
    ProcessSelection(s);
    if s <> -1 then
      DoItemClick(s);
  end;
  FDownItemIndex := -1;
  FHoveredItemIndex := -1;
  InvalidateItems;
end;

procedure TTMSFNCCustomCategoryList.HandlePopup(AItem: TTMSFNCCategoryListDisplayItem);
var
  it: TTMSFNCCategoryListItem;
  r: TRectF;
  pt: TPointF;
begin
  it := AItem.Item;
  if Assigned(it) and Assigned(it.PopupControl) then
  begin
    case it.PopupMode of
      ipmPopupControlSize: r := AItem.Rect;
      ipmControlSize:
      begin
        case Mode of
          clmHorizontal: r := RectF(LocalRect.Left, AItem.Rect.Top, LocalRect.Right, AItem.Rect.Bottom);
          clmVertical: r := RectF(AItem.Rect.Left, LocalRect.Top, AItem.Rect.Right, LocalRect.Bottom);
          else
            r := RectF(0, 0, 0, 0);
        end;
        case Mode of
          clmHorizontal: it.PopupControl.Width := Round(Width);
          clmVertical: it.PopupControl.Height := Round(Height);
        end;
      end;
      ipmCustom:
      begin
        r := AItem.Rect;
        case Mode of
          clmHorizontal:
          begin
            it.PopupControl.Width := Round(it.PopupWidth);
            it.PopupControl.Height := Round(it.PopupHeight);
          end;
          clmVertical:
          begin
            it.PopupControl.Width := Round(it.PopupHeight);
            it.PopupControl.Height := Round(it.PopupWidth);
          end;
        end;
      end;
      else
        r := RectF(0, 0, 0, 0);
    end;

    case Mode of
      clmHorizontal:
      begin
        case it.PopupOrientation of
          ipoUp: pt := LocalToScreenEx(PointF(r.Left + ((r.Right - r.Left) - it.PopupControl.Width) / 2, r.Top - it.PopupControl.Height));
          ipoDown: pt := LocalToScreenEx(PointF(r.Left + ((r.Right - r.Left) - it.PopupControl.Width) / 2, r.Bottom));
          else
            pt := PointF(0, 0);
        end;
      end;
      clmVertical:
      begin
        case it.PopupOrientation of
          ipoUp: pt := LocalToScreenEx(PointF(r.Left - it.PopupControl.Width, r.Top + ((r.Bottom - r.Top) - it.PopupControl.Height) / 2));
          ipoDown: pt := LocalToScreenEx(PointF(r.Right, r.Top + ((r.Bottom - r.Top) - it.PopupControl.Height) / 2));
          else
            pt := PointF(0, 0);
        end;
      end
      else
        pt := PointF(0, 0);
    end;

    FPopup.DropDownHeight := it.PopupControl.Height;
    FPopup.DropDownWidth := it.PopupControl.Width;
    FPopup.ContentControl := it.PopupControl;
    if Assigned(it.FocusedControl) then
      FPopup.FocusedControl := it.FocusedControl
    else
      FPopup.FocusedControl := it.PopupControl;

    FPopup.PlacementRectangle.Left := pt.X;
    FPopup.PlacementRectangle.Top := pt.Y;
    FPopup.PlacementRectangle.Right := pt.X + FPopup.DropDownWidth;
    FPopup.PlacementRectangle.Bottom := pt.Y + FPopup.DropDownHeight;

    FPopup.Popup;
  end
end;

function TTMSFNCCustomCategoryList.HasHint: Boolean;
var
  it: TTMSFNCCategoryListItem;
begin
  Result := False;
  if (FHoveredItemIndex >= 0) and (FHoveredItemIndex <= FItems.Count - 1) then
  begin
    it := FItems[FHoveredItemIndex];
    Result := it.Hint <> '';
  end;
end;

procedure TTMSFNCCustomCategoryList.Draw(AGraphics: TTMSFNCGraphics; ARect: TRectF);
var
  a: Boolean;
begin
  inherited;
  a := True;
  AGraphics.BitmapContainer := BitmapContainer;
  DoBeforeDraw(AGraphics, ARect, a);
  if a then
  begin
    DrawItems(AGraphics);
    DoAfterDraw(AGraphics, ARect);
  end;
end;

procedure TTMSFNCCustomCategoryList.ProcessSelection(AItemIndex: Integer);
var
  it: TTMSFNCCategoryListItem;
  prev: Integer;
begin
  if (AItemIndex >= 0) and (AItemIndex <= Items.Count - 1) then
  begin
    it := FItems[AItemIndex];
    if it.CanSelect then
    begin
      prev := FSelectedItemIndex;
      if it.CanDeselect and (it.Index = FSelectedItemIndex) then
        FSelectedItemIndex := -1
      else
        FSelectedItemIndex := it.Index;

      if FSelectedItemIndex <> -1 then
        FFocusedItemIndex := FSelectedItemIndex;

      if it.CanDeselect and (prev <> -1) then
        DoItemDeSelected(prev);

      if FSelectedItemIndex <> -1 then
      begin
        if not EmbeddedMode then
          HandlePopup(GetDisplayItem(FSelectedItemIndex))
        else
          HandleEmbeddedControl(GetDisplayItem(FSelectedItemIndex));

        DoItemSelected(FSelectedItemIndex);
      end;
    end;
  end;
end;

procedure TTMSFNCCustomCategoryList.InvalidateItems;
begin
  Invalidate;
end;

procedure TTMSFNCCustomCategoryList.ResetToDefaultStyle;
begin
  inherited;
  Fill.Kind := gfkSolid;
  Stroke.Kind := gskSolid;
  Fill.Color := gcWhite;
  Stroke.Color := gcSilver;

  Appearance.Fill.Color := Lighter(gcLightgray, 50);
  Appearance.FillHover.Color := Lighter(gcLightslategray, 50);
  Appearance.FillDown.Color := Lighter(gcSlategray, 50);
  Appearance.FillSelected.Color := Lighter(gcSlategray, 50);
  Appearance.FillDisabled.Color := Lighter(gcGray, 50);

  Appearance.Stroke.Color := gcDarkgray;
  Appearance.StrokeHover.Color := gcLightslategray;
  Appearance.StrokeDown.Color := gcSlategray;
  Appearance.StrokeSelected.Color := gcDarkslategray;
  Appearance.StrokeDisabled.Color := gcDarkgray;

  Appearance.Font.Color := gcBlack;

  Appearance.Fill.Kind := gfkSolid;
  Appearance.FillHover.Kind := gfkSolid;
  Appearance.FillDown.Kind := gfkSolid;
  Appearance.FillSelected.Kind := gfkSolid;
  Appearance.FillDisabled.Kind := gfkSolid;

  Appearance.Stroke.Kind := gskSolid;
  Appearance.StrokeHover.Kind := gskSolid;
  Appearance.StrokeDown.Kind := gskSolid;
  Appearance.StrokeSelected.Kind := gskSolid;
  Appearance.StrokeDisabled.Kind := gskSolid;

  Appearance.SeparatorStroke.Kind := gskSolid;
end;

procedure TTMSFNCCustomCategoryList.UpdateActivePopup;
begin
  HandlePopup(GetDisplayItem(FSelectedItemIndex));
end;

procedure TTMSFNCCustomCategoryList.UpdateControlAfterResize;
begin
  inherited;
  CalculateItems;
end;

function TTMSFNCCustomCategoryList.GetBitmapContainer: TTMSFNCBitmapContainer;
begin
  Result := FBitmapContainer;
end;

function TTMSFNCCustomCategoryList.GetColumns: Integer;
begin
  case Mode of
    clmHorizontal:
    begin
      if Columns = -1 then
        Result := Items.Count
      else
        Result := Columns;
    end;
    clmVertical: Result := 1;
    else
      Result := 0;
  end;
end;

function TTMSFNCCustomCategoryList.GetDisplayItem(AItemIndex: Integer): TTMSFNCCategoryListDisplayItem;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
begin
  Result.Rect := RectF(0, 0, 0, 0);
  Result.Item := nil;
  Result.PageIndex := -1;
  Result.Row := -1;
  Result.Column := -1;
  Result.ColumnSpan := -1;
  Result.RowSpan := -1;
  for I := 0 to FDisplayList.Count - 1 do
  begin
    it := FDisplayList[I].Item;
    if Assigned(it) and (it.Index = AItemIndex) then
    begin
      Result := FDisplayList[I];
      Break;
    end;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetAppearance(
  const Value: TTMSFNCCategoryListAppearance);
begin
  FAppearance.Assign(Value);
end;

procedure TTMSFNCCustomCategoryList.SetBitmapContainer(
  const Value: TTMSFNCBitmapContainer);
begin
  FBitmapContainer := Value;
  CalculateItems;
end;

procedure TTMSFNCCustomCategoryList.SetColumns(const Value: Integer);
begin
  if FColumns <> Value then
  begin
    FColumns := Value;
    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetEmbeddedItemPosition(
  const Value: TTMSFNCCategoryListEmbeddedItemPosition);
begin
  if FEmbeddedItemPosition <> Value then
  begin
    FEmbeddedItemPosition := Value;
    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetEmbeddedSize(const Value: Single);
begin
  if FEmbeddedSize <> Value then
  begin
    FEmbeddedSize := Value;
    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetEmbeddedMode(
  const Value: Boolean);
begin
  if FEmbeddedMode <> Value then
  begin
    FEmbeddedMode := Value;
    if not (csLoading in ComponentState) then
    begin
      if not EmbeddedMode then
      begin
        {$IFDEF FMXLIB}
        case Mode of
          clmHorizontal: SetBounds(Left, Top, Width, Height - EmbeddedSize);
          clmVertical: SetBounds(Left, Top, Width - EmbeddedSize, Height);
        end;
        {$ENDIF}
        {$IFDEF CMNLIB}
        case Mode of
          clmHorizontal: SetBounds(Left, Top, Width, Round(Height - EmbeddedSize));
          clmVertical: SetBounds(Left, Top, Round(Width - EmbeddedSize), Height);
        end;
        {$ENDIF}
      end
      else
      begin
        {$IFDEF FMXLIB}
        case Mode of
          clmHorizontal: SetBounds(Left, Top, Width, Height + EmbeddedSize);
          clmVertical: SetBounds(Left, Top, Width + EmbeddedSize, Height);
        end;
        {$ENDIF}
        {$IFDEF CMNLIB}
        case Mode of
          clmHorizontal: SetBounds(Left, Top, Width, Round(Height + EmbeddedSize));
          clmVertical: SetBounds(Left, Top, Round(Width + EmbeddedSize), Height);
        end;
        {$ENDIF}
      end;
    end;

    if EmbeddedMode then
    begin
      if SelectedItemIndex = -1 then
        SelectedItemIndex := GetFirstSelectableItem;
    end;

    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetItems(const Value: TTMSFNCCategoryListItems);
begin
  FItems.Assign(Value);
end;

procedure TTMSFNCCustomCategoryList.SetMode(
  const Value: TTMSFNCCategoryListMode);
begin
  if FMode <> Value then
  begin
    FMode := Value;
    if not (csLoading in ComponentState) then
      SetBounds(Left, Top, Height, Width);
    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetRows(const Value: Integer);
begin
  if FRows <> Value then
  begin
    FRows := Value;
    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.SetSelectedItemIndex(const Value: Integer);
begin
  if FSelectedItemIndex <> Value then
  begin
    FSelectedItemIndex := Value;
    FFocusedItemIndex := Value;
    CalculateItems;
  end;
end;

procedure TTMSFNCCustomCategoryList.HandleEmbeddedControl(AItem: TTMSFNCCategoryListDisplayItem);
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
  begin
    if Assigned(Items[I].PopupControl) then
    begin
      if (AItem.Item = Items[I]) and EmbeddedMode then
      begin
        {$IFDEF FMXLIB}
        Items[I].PopupControl.Align := TAlignLayout.None;
        {$ENDIF}
        {$IFDEF CMNLIB}
        Items[I].PopupControl.Align := alNone;
        {$ENDIF}
        case Mode of
          clmHorizontal:
          begin
            Items[I].PopupControl.Width := Width;
            {$IFDEF FMXLIB}
            Items[I].PopupControl.Position.X := 0;
            Items[I].PopupControl.Height := EmbeddedSize;
            case EmbeddedItemPosition of
              cleTop: Items[I].PopupControl.Position.Y := Height - EmbeddedSize;
              cleBottom: Items[I].PopupControl.Position.Y := 0;
            end;
            {$ENDIF}
            {$IFDEF CMNLIB}
            Items[I].PopupControl.Left := 0;
            Items[I].PopupControl.Height := Round(EmbeddedSize);
            case EmbeddedItemPosition of
              cleTop: Items[I].PopupControl.Top := Round(Height - EmbeddedSize);
              cleBottom: Items[I].PopupControl.Top := 0;
            end;
            {$ENDIF}
          end;
          clmVertical:
          begin
            Items[I].PopupControl.Height := Height;
            {$IFDEF FMXLIB}
            Items[I].PopupControl.Position.Y := 0;
            Items[I].PopupControl.Width := EmbeddedSize;
            case EmbeddedItemPosition of
              cleTop: Items[I].PopupControl.Position.X := Width - EmbeddedSize;
              cleBottom: Items[I].PopupControl.Position.X := 0;
            end;
            {$ENDIF}
            {$IFDEF CMNLIB}
            Items[I].PopupControl.Top := 0;
            Items[I].PopupControl.Width := Round(EmbeddedSize);
            case EmbeddedItemPosition of
              cleTop: Items[I].PopupControl.Left := Round(Width - EmbeddedSize);
              cleBottom: Items[I].PopupControl.Left := 0;
            end;
            {$ENDIF}
          end;
        end;

        Items[I].PopupControl.Parent := Self;
        Items[I].PopupControl.Visible := True;
      end
      else
      begin
        Items[I].PopupControl.Parent := nil;
        Items[I].PopupControl.Visible := False;
      end;
    end;
  end;
end;

function TTMSFNCCustomCategoryList.XYToItem(X, Y: Single): Integer;
var
  I: Integer;
  it: TTMSFNCCategoryListItem;
begin
  Result := -1;
  for I := 0 to FDisplayList.Count - 1 do
  begin
    if PtInRectEx(FDisplayList[I].Rect, PointF(X, Y)) then
    begin
      it := FDisplayList[I].Item;
      if Assigned(it) and it.Enabled and not it.Separator then
      begin
        Result := it.Index;
        Break;
      end;
    end;
  end;
end;

{ TTMSFNCCategoryListItem }

procedure TTMSFNCCategoryListItem.Assign(Source: TPersistent);
begin
  if Source is TTMSFNCCategoryListItem then
  begin
    FRowSpan := (Source as TTMSFNCCategoryListItem).RowSpan;
    FColumnSpan := (Source as TTMSFNCCategoryListItem).ColumnSpan;
    FVisible := (Source as TTMSFNCCategoryListItem).Visible;
    FText := (Source as TTMSFNCCategoryListItem).Text;
    FEnabled := (Source as TTMSFNCCategoryListItem).Enabled;
    FSeparator := (Source as TTMSFNCCategoryListItem).Separator;
    FSeparatorHeight := (Source as TTMSFNCCategoryListItem).SeparatorHeight;
    FMargins.Assign((Source as TTMSFNCCategoryListItem).Margins);
    FCanDeselect := (Source as TTMSFNCCategoryListItem).CanDeselect;
    FCanSelect := (Source as TTMSFNCCategoryListItem).CanSelect;
    FHint := (Source as TTMSFNCCategoryListItem).Hint;
    FPopupHeight := (Source as TTMSFNCCategoryListItem).PopupHeight;
    FPopupWidth := (Source as TTMSFNCCategoryListItem).PopupWidth;
    FPopupMode := (Source as TTMSFNCCategoryListItem).PopupMode;
    FBitmaps.Assign((Source as TTMSFNCCategoryListItem).Bitmaps);
    FDisabledBitmaps.Assign((Source as TTMSFNCCategoryListItem).DisabledBitmaps);
    FPopupOrientation := (Source as TTMSFNCCategoryListItem).PopupOrientation;
  end;
end;

procedure TTMSFNCCategoryListItem.BitmapsChanged(Sender: TObject);
begin
  if Assigned(FOwner) then
    FOwner.CalculateItems;
end;

constructor TTMSFNCCategoryListItem.Create(ACollection: TCollection);
begin
  inherited;
  if Assigned(Collection) then
    FOwner := (Collection as TTMSFNCCategoryListItems).FOwner;
  FSeparator := False;
  FPopupWidth := 400;
  FPopupHeight := 250;
  FPopupOrientation := ipoDown;
  FPopupMode := ipmControlSize;
  FColumnSpan := 1;
  FCanDeselect := False;
  FCanSelect := True;
  FRowSpan := 1;
  FMargins := TTMSFNCMargins.Create;
  FMargins.OnChange := @MarginsChanged;
  FEnabled := True;
  FSeparatorHeight := 5;
  FVisible := True;
  FBitmaps := TTMSFNCScaledBitmaps.Create(Self);
  FBitmaps.OnChange := @BitmapsChanged;
  FDisabledBitmaps := TTMSFNCScaledBitmaps.Create(Self);
  FDisabledBitmaps.OnChange := @BitmapsChanged;
  if Assigned(FOwner) then
    FOwner.CalculateItems;
end;

destructor TTMSFNCCategoryListItem.Destroy;
begin
  FPopupControl := nil;
  FDisabledBitmaps.Free;
  FBitmaps.Free;
  FMargins.Free;
  inherited;
  if Assigned(FOwner) then
    FOwner.CalculateItems;
end;

function TTMSFNCCategoryListItem.GetBitmapContainer: TTMSFNCBitmapContainer;
var
  l: TTMSFNCCustomCategoryList;
begin
  Result := nil;
  l := FOwner;
  if Assigned(l) then
    Result := l.BitmapContainer;
end;

function TTMSFNCCategoryListItem.IsPopupHeightStored: Boolean;
begin
  Result := PopupHeight <> 250;
end;

function TTMSFNCCategoryListItem.IsPopupWidthStored: Boolean;
begin
  Result := PopupWidth <> 400;
end;

function TTMSFNCCategoryListItem.IsSeparatorHeightStored: Boolean;
begin
  Result := SeparatorHeight <> 5;
end;

procedure TTMSFNCCategoryListItem.MarginsChanged(Sender: TObject);
begin
  FOwner.CalculateItems;
end;

procedure TTMSFNCCategoryListItem.SetBitmaps(const Value: TTMSFNCScaledBitmaps);
begin
  FBitmaps.Assign(Value);
end;

procedure TTMSFNCCategoryListItem.SetCanDeselect(const Value: Boolean);
begin
  FCanDeselect := Value;
end;

procedure TTMSFNCCategoryListItem.SetCanSelect(const Value: Boolean);
begin
  FCanSelect := Value;
end;

procedure TTMSFNCCategoryListItem.SetColumnSpan(const Value: Integer);
begin
  if FColumnSpan <> Value then
  begin
    FColumnSpan := Value;
    FOwner.CalculateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetDisabledBitmaps(
  const Value: TTMSFNCScaledBitmaps);
begin
  FDisabledBitmaps.Assign(Value);
end;

procedure TTMSFNCCategoryListItem.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    FOwner.InvalidateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetFocusedControl(const Value: TControl);
begin
  FFocusedControl := Value;
end;

procedure TTMSFNCCategoryListItem.SetHorizontalTextAlign(
  const Value: TTMSFNCGraphicsTextAlign);
begin
  if FHorizontalTextAlign <> Value then
  begin
    FHorizontalTextAlign := Value;
    FOwner.InvalidateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetMargins(const Value: TTMSFNCMargins);
begin
  FMargins.Assign(Value);
end;

procedure TTMSFNCCategoryListItem.SetPopupControl(const Value: TControl);
begin
  if Value = nil then
  begin
    if Assigned(FPopupControl) then
      FPopupControl.Visible := True;
  end;

  FPopupControl := Value;
  if Assigned(FPopupControl) then
    FPopupControl.Visible := False;
end;

procedure TTMSFNCCategoryListItem.SetPopupHeight(const Value: Single);
begin
  if FPopupHeight <> Value then
  begin
    FPopupHeight := Value;
    if Assigned(FOwner) then
      FOwner.UpdateActivePopup;
  end;
end;

procedure TTMSFNCCategoryListItem.SetPopupMode(
  const Value: TTMSFNCCategoryListItemPopupMode);
begin
  if FPopupMode <> Value then
  begin
    FPopupMode := Value;
    if Assigned(FOwner) then
      FOwner.UpdateActivePopup;
  end;
end;

procedure TTMSFNCCategoryListItem.SetPopupOrientation(
  const Value: TTMSFNCCategoryListItemPopupOrientation);
begin
  if FPopupOrientation <> Value then
  begin
    FPopupOrientation := Value;
    if Assigned(FOwner) then
      FOwner.UpdateActivePopup;
  end;
end;

procedure TTMSFNCCategoryListItem.SetPopupWidth(const Value: Single);
begin
  if FPopupWidth <> Value then
  begin
    FPopupWidth := Value;
    if Assigned(FOwner) then
      FOwner.UpdateActivePopup;
  end;
end;

procedure TTMSFNCCategoryListItem.SetRowSpan(const Value: Integer);
begin
  if FRowSpan <> Value then
  begin
    FRowSpan := Value;
    FOwner.CalculateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetSeparator(const Value: Boolean);
begin
  if FSeparator <> Value then
  begin
    FSeparator := Value;
    FOwner.CalculateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetSeparatorHeight(const Value: Single);
begin
  if FSeparatorHeight <> Value then
  begin
    FSeparatorHeight := Value;
    FOwner.InvalidateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetText(const Value: String);
begin
  if FText <> Value then
  begin
    FText := Value;
    FOwner.InvalidateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetVerticalTextAlign(
  const Value: TTMSFNCGraphicsTextAlign);
begin
  if FVerticalTextAlign <> Value then
  begin
    FVerticalTextAlign := Value;
    FOwner.InvalidateItems;
  end;
end;

procedure TTMSFNCCategoryListItem.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    FOwner.CalculateItems;
  end;
end;

function TTMSFNCCategoryListItem.State: TTMSFNCCategoryListItemState;
begin
  Result := isNormal;
  if not Separator then
  begin
    if Enabled then
    begin
      if Index = FOwner.FDownItemIndex then
        Result := isDown
      else if Index = FOwner.FHoveredItemIndex then
        Result := isHover
      else if Index = FOwner.FSelectedItemIndex then
        Result := isSelected
    end
    else
      Result := isDisabled;
  end;
end;

{ TTMSFNCCategoryListItems }

function TTMSFNCCategoryListItems.Add: TTMSFNCCategoryListItem;
begin
  Result := TTMSFNCCategoryListItem(inherited Add);
end;

constructor TTMSFNCCategoryListItems.Create(AOwner: TTMSFNCCustomCategoryList);
begin
  inherited Create(AOwner, CreateItemClass);
  FOwner := AOwner;
end;

function TTMSFNCCategoryListItems.CreateItemClass: TCollectionItemClass;
begin
  Result := TTMSFNCCategoryListItem;
end;

function TTMSFNCCategoryListItems.GetItem(
  Index: Integer): TTMSFNCCategoryListItem;
begin
  Result := TTMSFNCCategoryListItem(inherited Items[Index]);
end;

function TTMSFNCCategoryListItems.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TTMSFNCCategoryListItems.Insert(
  Index: Integer): TTMSFNCCategoryListItem;
begin
  Result := TTMSFNCCategoryListItem(inherited Insert(Index));
end;

procedure TTMSFNCCategoryListItems.SetItem(Index: Integer;
  const Value: TTMSFNCCategoryListItem);
begin
  inherited Items[Index] := Value;
end;

{ TTMSFNCCategoryListAppearance }

procedure TTMSFNCCategoryListAppearance.Assign(Source: TPersistent);
begin
  if Source is TTMSFNCCategoryListAppearance then
  begin
    FFill.Assign((Source as TTMSFNCCategoryListAppearance).Fill);
    FFillHover.Assign((Source as TTMSFNCCategoryListAppearance).FillHover);
    FFillSelected.Assign((Source as TTMSFNCCategoryListAppearance).FillSelected);
    FFillDisabled.Assign((Source as TTMSFNCCategoryListAppearance).FillDisabled);
    FFillDown.Assign((Source as TTMSFNCCategoryListAppearance).FillDown);
    FStroke.Assign((Source as TTMSFNCCategoryListAppearance).Stroke);
    FStrokeHover.Assign((Source as TTMSFNCCategoryListAppearance).StrokeHover);
    FStrokeSelected.Assign((Source as TTMSFNCCategoryListAppearance).StrokeSelected);
    FStrokeDown.Assign((Source as TTMSFNCCategoryListAppearance).StrokeDown);
    FStrokeDisabled.Assign((Source as TTMSFNCCategoryListAppearance).StrokeDisabled);
    FVerticalSpacing := (Source as TTMSFNCCategoryListAppearance).VerticalSpacing;
    FHorizontalSpacing := (Source as TTMSFNCCategoryListAppearance).HorizontalSpacing;
    FSeparatorStroke.Assign((Source as TTMSFNCCategoryListAppearance).SeparatorStroke);
    FFont.Assign((Source as TTMSFNCCategoryListAppearance).Font);
  end;
end;

procedure TTMSFNCCategoryListAppearance.Changed;
begin
  FOwner.CalculateItems;
end;

constructor TTMSFNCCategoryListAppearance.Create(AOwner: TTMSFNCCustomCategoryList);
begin
  FOwner := AOwner;
  FFill := TTMSFNCGraphicsFill.Create(gfkNone);
  FFill.Color := Lighter(gcLightgray, 50);
  FFillHover := TTMSFNCGraphicsFill.Create;
  FFillHover.Color := Lighter(gcLightslategray, 50);
  FFillDown := TTMSFNCGraphicsFill.Create;
  FFillDown.Color := Lighter(gcSlategray, 50);
  FFillSelected := TTMSFNCGraphicsFill.Create;
  FFillSelected.Color := Lighter(gcSlategray, 50);
  FFillDisabled := TTMSFNCGraphicsFill.Create;
  FFillDisabled.Color := Lighter(gcGray, 50);

  FStroke := TTMSFNCGraphicsStroke.Create(gskNone);
  FStroke.Color := gcDarkgray;
  FStrokeHover := TTMSFNCGraphicsStroke.Create;
  FStrokeHover.Color := gcLightslategray;
  FStrokeDown := TTMSFNCGraphicsStroke.Create;
  FStrokeDown.Color := gcSlategray;
  FStrokeSelected := TTMSFNCGraphicsStroke.Create;
  FStrokeSelected.Color := gcDarkslategray;
  FStrokeDisabled := TTMSFNCGraphicsStroke.Create;
  FStrokeDisabled.Color := gcDarkgray;

  FSeparatorStroke := TTMSFNCGraphicsStroke.Create;
  FSeparatorStroke.Color := gcDarkGray;

  FFont := TTMSFNCGraphicsFont.Create;
  FFont.OnChanged := @FontChanged;

  FSeparatorStroke.OnChanged := @StrokeChanged;
  FFont.OnChanged := @FontChanged;

  FFill.OnChanged := @FillChanged;
  FFillDown.OnChanged := @FillChanged;
  FFillHover.OnChanged := @FillChanged;
  FFillSelected.OnChanged := @FillChanged;
  FFillDisabled.OnChanged := @FillChanged;

  FStroke.OnChanged := @StrokeChanged;
  FStrokeHover.OnChanged := @StrokeChanged;
  FStrokeDown.OnChanged := @StrokeChanged;
  FStrokeDisabled.OnChanged := @StrokeChanged;
  FStrokeSelected.OnChanged := @StrokeChanged;

  FHorizontalSpacing := 0;
  FVerticalSpacing := 0;
end;

destructor TTMSFNCCategoryListAppearance.Destroy;
begin
  FFont.Free;
  FFill.Free;
  FFillDown.Free;
  FFillSelected.Free;
  FFillHover.Free;
  FFillDisabled.Free;
  FSeparatorStroke.Free;
  FStroke.Free;
  FStrokeDown.Free;
  FStrokeSelected.Free;
  FStrokeHover.Free;
  FStrokeDisabled.Free;
  inherited;
end;

procedure TTMSFNCCategoryListAppearance.FillChanged(Sender: TObject);
begin
  FOwner.InvalidateItems;
end;

procedure TTMSFNCCategoryListAppearance.FontChanged(Sender: TObject);
begin
  FOwner.InvalidateItems;
end;

function TTMSFNCCategoryListAppearance.IsHorizontalSpacingStored: Boolean;
begin
  Result := HorizontalSpacing <> 0;
end;

function TTMSFNCCategoryListAppearance.IsVerticalSpacingStored: Boolean;
begin
  Result := VerticalSpacing <> 0
end;

procedure TTMSFNCCategoryListAppearance.SetFill(const Value: TTMSFNCGraphicsFill);
begin
  FFill.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetFillDisabled(const Value: TTMSFNCGraphicsFill);
begin
  FFillDisabled.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetFillDown(const Value: TTMSFNCGraphicsFill);
begin
  FFillDown.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetFillHover(const Value: TTMSFNCGraphicsFill);
begin
  FFillHover.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetFillSelected(const Value: TTMSFNCGraphicsFill);
begin
  FFillSelected.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetFont(const Value: TTMSFNCGraphicsFont);
begin
  FFont.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetHorizontalSpacing(
  const Value: Single);
begin
  if FHorizontalSpacing <> Value then
  begin
    FHorizontalSpacing := Value;
    Changed;
  end;
end;

procedure TTMSFNCCategoryListAppearance.SetSeparatorStroke(
  const Value: TTMSFNCGraphicsStroke);
begin
  FSeparatorStroke.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetStroke(const Value: TTMSFNCGraphicsStroke);
begin
  FStroke.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetStrokeDisabled(
  const Value: TTMSFNCGraphicsStroke);
begin
  FStrokeDisabled.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetStrokeDown(
  const Value: TTMSFNCGraphicsStroke);
begin
  FStrokeDown.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetStrokeHover(
  const Value: TTMSFNCGraphicsStroke);
begin
  FStrokeHover.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetStrokeSelected(
  const Value: TTMSFNCGraphicsStroke);
begin
  FStrokeSelected.Assign(Value);
end;

procedure TTMSFNCCategoryListAppearance.SetVerticalSpacing(const Value: Single);
begin
  if FVerticalSpacing <> Value then
  begin
    FVerticalSpacing := Value;
    Changed;
  end;
end;

procedure TTMSFNCCategoryListAppearance.StrokeChanged(Sender: TObject);
begin
  FOwner.InvalidateItems;
end;

{ TTMSFNCCategoryListDisplayItem }

{$IFDEF WEBLIB}
function TTMSFNCCategoryListDisplayList.GetItem(Index: Integer): TTMSFNCCategoryListDisplayItem;
begin
  Result := TTMSFNCCategoryListDisplayItem(inherited Items[Index]);
end;

procedure TTMSFNCCategoryListDisplayList.SetItem(Index: Integer; const Value: TTMSFNCCategoryListDisplayItem);
var
  v: TTMSFNCCategoryListDisplayItem;
begin
  v := Value;
  inherited Items[Index] := v;
end;
{$ENDIF}

{$IFDEF LCLLIB}
class operator TTMSFNCCategoryListDisplayItem.=(z1, z2: TTMSFNCCategoryListDisplayItem)b: boolean;
begin
  Result := z1 = z2;
end;

class operator TTMSFNCCategoryListPositionItem.=(z1, z2: TTMSFNCCategoryListPositionItem)b: boolean;
begin
  Result := z1 = z2;
end;
{$ENDIF}

{ TTMSFNCCategoryList }

procedure TTMSFNCCategoryList.RegisterRuntimeClasses;
begin
  inherited;
  RegisterClasses([TTMSFNCCategoryList, TTMSFNCCategoryListItem]);
end;

initialization
  RegisterClass(TTMSFNCCategoryList);

end.
