Setup.Package
{
 	vendor = "liflg.org",
 	id = "sof",
 	description = "Soldier of Fortune",
 	version = "1.06a-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "sof-disc",
		description = "Soldier of Fortune Loki Disc",
		uniquefile = "bin/x86/glibc-2.1/sof"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Soldier of Fortune",
		bytes = 760905475,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Soldier of Fortune",
                        genericname = "Soldier of Fortune",
                        tooltip = "Play Soldier of Fortune",
                        builtin_icon = false,
                        icon = "sof.xpm",
                        commandline = "%0/sof.sh",
                        category = "Game",
                },

		Setup.File {
			source = "media://sof-disc/paks.tar.gz",
		},

		Setup.File {
			source = "media://sof-disc/binaries.tar.gz",
			permissions = "0755",
		},

		Setup.File {
			source = "media://sof-disc/bin/x86/glibc-2.1/",
			permissions = "0755",
		},

		Setup.File 
		{
			wildcards = "sof.sh",
			permissions = "0755",
		},
		Setup.File
		{	
			wildcards = "README.liflg"
		},

		Setup.File {
			source = "media://sof-disc/",
			wildcards = {"kver.pub", "README", "sof.xpm" },
		},

		Setup.Option {
			required = true,
			value = true,
			description = "Apply Patch 1.06a",
			tooltip = "Latest update from Loki",
			bytes = 61552640,
			Setup.File
			{
				allowoverwrite = true,
				source = "base:///patch-1.06a.tar",
				filter = function(dest)
					if ( string.match( dest, "sof" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},
		},
	},
}			
