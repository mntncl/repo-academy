table 50100 Student
{

    DataClassification = CustomerContent;
    Caption = 'Student';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Nr.';
        }
        field(2; "Last Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Last Name';
        }
        field(3; "First Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'First Name';
        }
        field(4; City; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'City';
        }
        field(5; Country; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
            Caption = 'Country';
        }
        field(10; Gender; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Gender';
            OptionMembers = " ",Male,Female;
            OptionCaption = ' ,Male,Female';
        }
        field(11; "Date of Birth"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date of Birth';
            trigger OnValidate()
            begin
                //Age :=
            end;
        }
        field(12; Age; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Age';
        }
        field(20; "Average Rating"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 10;
            Caption = 'Average Rating';
        }
        field(21; Graduated; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Graduated';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
        key(Key02; Country, "Average Rating")
        {

        }
    }

    trigger OnInsert()
    begin
        TestField(Code); // Controlla se il campo in questione sia vuoto o meno
        if Rec.Graduated then
            Rec."Average Rating" := 100;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnRename()
    begin

    end;

    trigger OnDelete()
    begin

    end;
}