{ lib, stdenv, fetchFromGitLab, autoreconfHook}:


stdenv.mkDerivation rec {
  pname = "html2text";
  version = "2.2.3";

# TODO see other github
  src = fetchFromGitLab {
    owner = "grobian";
    repo = "html2text";
    rev = "40c175152835fc41f01d89058145c3da4f62ae3a";
    hash = "sha256-7Ch51nJ5BeRqs4PEIPnjCGk+Nm2ydgJQCtkcpihXun8=";
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = optionals stdenv.isDarwin [ libiconv ]

  meta = {
    description = "Convert HTML to plain text";
    mainProgram = "html2text";
    homepage = "https://gitlab.com/grobian/html2text";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.unix;
    maintainers = [ lib.maintainers.eikek ];
  };
}
