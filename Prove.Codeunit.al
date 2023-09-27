codeunit 50100 Prove
{
    /*trigger OnRun()
    begin

    end;*/

    var
        myInt: Integer;

    local procedure Test()
    var // Variabile visualizzabile solo all'interno di questa procedura
        IntVal: Integer;
        DecVal: Decimal;
        Msg: Text;
        DatVal: Date;
    begin
        IntVal := 11;
        DecVal := 11.11;
        Msg := 'Hello ' + 'World!';
        DatVal := 0D; // Data vuota
        DatVal := 20230926D; // Formato yyyy/mm/dd, corrisponde a 26/09/2023

        if Msg <> '' then
            Message(Msg);

        if IntVal > 7 then begin
            DecVal := IntVal;
            DatVal := 0D;
        end else begin
            Msg := 'OK';
            // Altre istruzioni;
        end;

        if not ((IntVal <= 0) and (DecVal > 1))
        or (DatVal <> 0D) then begin

        end;

        if IntVal = 0 then
            if DecVal > 2 then begin

            end;

        case IntVal of
            1:
                begin
                    Message(Msg);
                    // ...
                end;
            2, 3, 4, 5:
                begin

                end;
            10 .. 20:
                begin

                end;
            else begin

            end;
        end;
    end;

    local procedure DoWhileLoop()
    /*var
        A : Integer;*/
    begin
        myInt := 10;
        while myInt > 0 do begin
            myInt -= 1;
            /*if A = 0 then
                break;*/
        end;
    end;

    local procedure RepeatUntilLoop()
    var
        Cust: Record Customer;
        TextVal: Text;
        CustomerLbl: Label 'Customer: ';
    begin
        myInt := 10;

        repeat
            Message(Format(myInt));
            myInt -= 1;
        until myInt > 0;

        // Tipico utilizzo di un repeat-until loop
        Cust.SetRange("Country/Region Code", 'IT');
        if Cust.FindSet() then
            repeat
                Message(Cust.Name);
                TextVal := CustomerLbl + Cust.Name;
            until Cust.Next() = 0;
    end;

    local procedure ForLoop()
    var
        I: Integer;
    begin
        for I := 1 to 3 do begin
            Message(Format(I));
            // ...
        end;
        myInt := 3;
        for I := 1 to myInt do begin
            Message(Format(I));
            // ...
        end;
    end;

    local procedure ForEachLoop()
    var
        Names: List of [Text];
        I: Integer;
        Txt: Text;
    begin
        Names.Add('Gianni');
        Names.Add('Paolo');
        Names.Add('Marcella');

        for I := 1 to Names.Count do begin
            Txt := Names.Get(I);
            Message(Txt);
        end;

        // Salva in automatico il contenuto della lista all'interno della variabile Txt
        foreach Txt in Names do begin
            Message(Txt);
        end;
    end;

    local procedure GetRecord()
    var
        Cust: Record Customer;
        SalesP: Record "Salesperson/Purchaser";
        SalesHdr: Record "Sales Header";
        CustNo: Code[20];
    begin
        Message(Cust.Name); // Non avendola ancora mossa, verrebbe stampato un valore nullo

        Cust.Get('10000');
        Message(Cust.Name); // Cannon Group SpA

        if SalesP.Get(Cust."Salesperson Code") then
            Message('Esiste agente')
        else
            Message('Non esiste agente');


        CustNo := '20000';
        Cust.Get(CustNo);

        SalesHdr.Get(SalesHdr."Document Type"::Order, '1003');
    end;

    local procedure FindSomething()
    var
        Vend: Record Vendor;
        LocCode1: Code[10];
        LocCode2: Code[10];
        SalesHdr: Record "Sales Header";
    begin
        if Vend.FindSet() then
            repeat

            until Vend.Next() = 0;

        Vend.Reset();

        // Ordinati in base all'ordinamento nativo
        /*Vend.FindFirst();
        Vend.FindLast();*/
        LocCode1 := 'BLU';
        LocCode2 := 'ROSSO';
        Vend.SetFilter("Location Code", '%1|%2', LocCode1, LocCode2);

        Vend.SetFilter(Name, 'A*');
        Vend.SetFilter(Balance, '>50');

        Vend.SetFilter(Balance, '=1200');
        Vend.SetRange(Balance, 1200);

        Vend.SetFilter(Balance, '>=1000&<=2000');
        Vend.SetRange(Balance, 1000, 2000);

        Vend.SetRange(Balance); // Senza parametri = rimuovi i filtri impostati

        Vend.SetCurrentKey(Name);
        Vend.SetCurrentKey(Name, City);
        Vend.Ascending := false; // Se impostato a false, effettua l'ordinamrnto in maniera discendente

        if not Vend.IsEmpty() then;

        SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::Invoice);
    end;

    local procedure WriteSomething()
    var
        Vend: Record Vendor;
        Cust: Record Customer;
        SalesHdr: Record "Sales Header";
    begin
        Cust."No." := 'TEST-01';
        Cust.Name := 'Sono io';
        // ...
        if not Cust.Insert() then;
        // ...

        Cust.Get('10000');
        Cust.Name := 'Paolo Rossi'; // Non fa partire trigger OnValidate
        Cust.Validate(Name, 'Paolo Rossi'); // Fa partire trigger OnValidate
        Cust.City := 'Vicenza';
        // ...
        Cust.Modify(true);

        Cust.SetRange("Location Code", 'BLU');
        if Cust.FindSet() then
            repeat
                Cust."Location Code" := 'ROSSO';
                Cust.Modify();
            until Cust.Next() = 0;

        Cust.SetRange("Location Code", 'BLU');
        Cust.ModifyAll("Location Code", 'ROSSO');

        Cust.Get('10000');
        Cust.Delete();

        Cust.SetRange("Location Code", 'BLU');
        if not Cust.IsEmpty then
            Cust.DeleteAll();
    end;
}