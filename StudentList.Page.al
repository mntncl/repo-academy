page 50100 "Student List"
{

    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Caption = 'City';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    Caption = 'Country';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    Caption = 'Gender';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    Caption = 'Date of Birth';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    BlankZero = true; // Non fa visualizzare gli zeri
                    Caption = 'Age';
                }
                field("Average Rating"; Rec."Average Rating")
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    Caption = 'Average Rating';
                }
                field(Graduated; Rec.Graduated)
                {
                    ApplicationArea = All;
                    Caption = 'Graduated';
                }
            }
        }
    }

    /*actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }*/

}