namespace HelloWorld

open Fabulous
open Fabulous.Maui
open Microsoft.Maui
open Microsoft.Maui.Graphics
open Microsoft.Maui.Accessibility
open Microsoft.Maui.Primitives

open type Fabulous.Maui.View

module App =
    type Model = { Count: int }

    type Msg = | Clicked

    type CmdMsg = SemanticAnnounce of string

    let semanticAnnounce text =
        Cmd.ofSub(fun _ -> SemanticScreenReader.Announce(text))

    let mapCmd cmdMsg =
        match cmdMsg with
        | SemanticAnnounce text -> semanticAnnounce text

    let init () = { Count = 0 }, []

    let update msg model =
        match msg with
        | Clicked -> { model with Count = model.Count + 1 }, [ SemanticAnnounce $"Clicked {model.Count} times" ]

    let view model =
        Application(
            ContentPage(    
                    (HStack(spacing = 10.) {
                        let text =
                            if model.Count = 0 then
                                "Folder"
                            else
                                $"Entering a new Folder!"

                        Button(text, Clicked)
                            .semantics(hint = "Enters a new folder.")
                            .centerVertical()
                    })
                        .padding(10., 0., 10., 0.)
                )
            )

    let program = Program.statefulWithCmdMsg init update view mapCmd
